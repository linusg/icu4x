// This file is part of ICU4X. For terms of use, please see the file
// called LICENSE at the top level of the ICU4X source tree
// (online at: https://github.com/unicode-org/icu4x/blob/main/LICENSE ).

//! Utilities for reading CodePointTrie data from TOML files.

use crate::codepointtrie::error::Error;
use crate::codepointtrie::CodePointTrie;
use crate::codepointtrie::CodePointTrieHeader;
use crate::codepointtrie::TrieType;
use crate::codepointtrie::TrieValue;
use alloc::string::String;
use alloc::vec::Vec;
use core::convert::TryFrom;
use zerovec::ZeroVec;

/// A Serde-compatible struct for reading serialized CodePointTrie TOML files
/// generated by ICU4C.
///
/// Use `TryInto` to convert [`CodePointTrieToml`] to a proper [`CodePointTrie`].
#[allow(clippy::upper_case_acronyms)]
#[derive(serde::Deserialize)]
pub struct CodePointTrieToml {
    #[serde(skip)]
    _short_name: String,
    #[serde(skip)]
    _long_name: String,
    #[serde(skip)]
    _name: String,
    index: Vec<u16>,
    data_8: Option<Vec<u8>>,
    data_16: Option<Vec<u16>>,
    data_32: Option<Vec<u32>>,
    #[serde(skip)]
    _index_length: u32,
    #[serde(skip)]
    _data_length: u32,
    #[serde(rename = "highStart")]
    high_start: u32,
    #[serde(rename = "shifted12HighStart")]
    shifted12_high_start: u16,
    #[serde(rename = "type")]
    trie_type_enum_val: u8,
    #[serde(rename = "valueWidth")]
    _value_width_enum_val: u8,
    #[serde(rename = "index3NullOffset")]
    index3_null_offset: u16,
    #[serde(rename = "dataNullOffset")]
    data_null_offset: u32,
    #[serde(rename = "nullValue")]
    null_value: u32,
}

/// Data slice from a CodePointTrie TOML.
///
/// ICU4C exports data as either `u8`, `u16`, or `u32`, which may be converted
/// to other types as appropriate.
#[allow(clippy::exhaustive_enums)] // based on a stable serialized form
pub enum CodePointDataSlice<'a> {
    /// A serialized CodePointTrie data array 8-bit values.
    U8(&'a [u8]),
    /// A serialized CodePointTrie data array 16-bit values.
    U16(&'a [u16]),
    /// A serialized CodePointTrie data array 32-bit values.
    U32(&'a [u32]),
}

impl CodePointTrieToml {
    /// Gets the `index` slice.
    pub fn index_slice(&self) -> &[u16] {
        self.index.as_slice()
    }

    /// Gets the `data` slice.
    pub fn data_slice(&self) -> Result<CodePointDataSlice, Error> {
        if let Some(data_8) = &self.data_8 {
            Ok(CodePointDataSlice::U8(data_8.as_slice()))
        } else if let Some(data_16) = &self.data_16 {
            Ok(CodePointDataSlice::U16(data_16.as_slice()))
        } else if let Some(data_32) = &self.data_32 {
            Ok(CodePointDataSlice::U32(data_32.as_slice()))
        } else {
            Err(Error::FromDeserialized {
                reason: "Did not find data array for CodePointTrie in TOML",
            })
        }
    }
}

impl TryFrom<&CodePointTrieToml> for CodePointTrieHeader {
    type Error = Error;

    fn try_from(cpt_data: &CodePointTrieToml) -> Result<Self, Self::Error> {
        let trie_type_enum: TrieType = TrieType::try_from(cpt_data.trie_type_enum_val)?;
        Ok(CodePointTrieHeader {
            high_start: cpt_data.high_start,
            shifted12_high_start: cpt_data.shifted12_high_start,
            index3_null_offset: cpt_data.index3_null_offset,
            data_null_offset: cpt_data.data_null_offset,
            null_value: cpt_data.null_value,
            trie_type: trie_type_enum,
        })
    }
}

impl<T: TrieValue> TryFrom<&CodePointTrieToml> for CodePointTrie<'static, T> {
    type Error = Error;

    fn try_from(cpt_data: &CodePointTrieToml) -> Result<CodePointTrie<'static, T>, Self::Error> {
        use CodePointDataSlice::*;
        let header = CodePointTrieHeader::try_from(cpt_data)?;
        let index: ZeroVec<u16> = ZeroVec::alloc_from_slice(&cpt_data.index);
        let data: Result<ZeroVec<'static, T>, T::TryFromU32Error> = match cpt_data.data_slice()? {
            U8(s) => s.iter().map(|i| T::try_from_u32(*i as u32)).collect(),
            U16(s) => s.iter().map(|i| T::try_from_u32(*i as u32)).collect(),
            U32(s) => s.iter().map(|i| T::try_from_u32(*i)).collect(),
        };

        let data = data.map_err(|_| Error::FromDeserialized {
            reason: "Could not parse data array to typed array",
        })?;
        CodePointTrie::<T>::try_new(header, index, data)
    }
}
