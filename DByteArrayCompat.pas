{
  Copyright 2018 Thimo Braker <thibmorozier@live.nl>

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
}
unit DByteArrayCompat;

interface
{$I ../DByteArrayCompat.inc}
uses
  SysUtils
  {$IFDEF IndyCompat}
  , IdGlobal
  {$ENDIF IndyCompat};

type
  TByteConverter = class sealed
  strict private
    type PBytes = ^TBytes;
    class var fNeedEndianSwap: Boolean;
    class function GetBytes(aSrc: PByte; aLength: Integer): TBytes; overload; static;
    class procedure PutBytes(var aDest: PByte; aBytes: TBytes; aOffset, aLength: Integer); overload; static;
  public
    class property NeedEndianSwap: Boolean read fNeedEndianSwap write fNeedEndianSwap;
    class function DoubleToInt64Bits(aValue: Double): Int64; static;
    class function Int64BitsToDouble(aValue: Int64): Double; static;
    class function GetBytes(aSrc: Boolean): TBytes; overload; static;
    class function GetBytes(aSrc: ShortInt): TBytes; overload; static;
    class function GetBytes(aSrc: SmallInt): TBytes; overload; static;
    class function GetBytes(aSrc: Integer): TBytes; overload; static;
    class function GetBytes(aSrc: Int64): TBytes; overload; static;
    class function GetBytes(aSrc: Word): TBytes; overload; static;
    class function GetBytes(aSrc: Cardinal): TBytes; overload; static;
    class function GetBytes(aSrc: UInt64): TBytes; overload; static;
    class function GetBytes(aSrc: Single): TBytes; overload; static;
    class function GetBytes(aSrc: Double): TBytes; overload; static;
    class function GetBytes(aSrc: AnsiChar): TBytes; overload; static;
    class function GetBytes(aSrc: Char): TBytes; overload; static;
    class function GetBytes(aSrc: AnsiString): TBytes; overload; static;
    class function GetBytes(aSrc: string): TBytes; overload; static;
    class function ToBoolean(aBytes: TBytes; aOffset: Integer): Boolean; {$IFDEF IndyCompat}overload; {$ENDIF IndyCompat}static;
    class function ToShortInt(aBytes: TBytes; aOffset: Integer): ShortInt; {$IFDEF IndyCompat}overload; {$ENDIF IndyCompat}static;
    class function ToSmallInt(aBytes: TBytes; aOffset: Integer): SmallInt; {$IFDEF IndyCompat}overload; {$ENDIF IndyCompat}static;
    class function ToInteger(aBytes: TBytes; aOffset: Integer): Integer; {$IFDEF IndyCompat}overload; {$ENDIF IndyCompat}static;
    class function ToInt64(aBytes: TBytes; aOffset: Integer): Int64; {$IFDEF IndyCompat}overload; {$ENDIF IndyCompat}static;
    class function ToWord(aBytes: TBytes; aOffset: Integer): Word; {$IFDEF IndyCompat}overload; {$ENDIF IndyCompat}static;
    class function ToCardinal(aBytes: TBytes; aOffset: Integer): Cardinal; {$IFDEF IndyCompat}overload; {$ENDIF IndyCompat}static;
    class function ToUInt64(aBytes: TBytes; aOffset: Integer): UInt64; {$IFDEF IndyCompat}overload; {$ENDIF IndyCompat}static;
    class function ToSingle(aBytes: TBytes; aOffset: Integer): Single; {$IFDEF IndyCompat}overload; {$ENDIF IndyCompat}static;
    class function ToDouble(aBytes: TBytes; aOffset: Integer): Double; {$IFDEF IndyCompat}overload; {$ENDIF IndyCompat}static;
    class function ToAnsiChar(aBytes: TBytes; aOffset: Integer): AnsiChar; {$IFDEF IndyCompat}overload; {$ENDIF IndyCompat}static;
    class function ToChar(aBytes: TBytes; aOffset: Integer): Char; {$IFDEF IndyCompat}overload; {$ENDIF IndyCompat}static;
    class function ToAnsiStr(aBytes: TBytes): AnsiString; overload; static;
    class function ToAnsiStr(aBytes: TBytes; aOffset: Integer): AnsiString; overload; static;
    class function ToAnsiStr(aBytes: TBytes; aOffset, aLength: Integer): AnsiString; overload; static;
    class function ToStr(aBytes: TBytes): string; overload; static;
    class function ToStr(aBytes: TBytes; aOffset: Integer): string; overload; static;
    class function ToStr(aBytes: TBytes; aOffset, aLength: Integer): string; overload; static;
    {$IFDEF IndyCompat}
    class function GetIdBytes(aSrc: Boolean): TIdBytes; overload; static;
    class function GetIdBytes(aSrc: ShortInt): TIdBytes; overload; static;
    class function GetIdBytes(aSrc: SmallInt): TIdBytes; overload; static;
    class function GetIdBytes(aSrc: Integer): TIdBytes; overload; static;
    class function GetIdBytes(aSrc: Int64): TIdBytes; overload; static;
    class function GetIdBytes(aSrc: Word): TIdBytes; overload; static;
    class function GetIdBytes(aSrc: Cardinal): TIdBytes; overload; static;
    class function GetIdBytes(aSrc: UInt64): TIdBytes; overload; static;
    class function GetIdBytes(aSrc: Single): TIdBytes; overload; static;
    class function GetIdBytes(aSrc: Double): TIdBytes; overload; static;
    class function GetIdBytes(aSrc: AnsiChar): TIdBytes; overload; static;
    class function GetIdBytes(aSrc: Char): TIdBytes; overload; static;
    class function GetIdBytes(aSrc: AnsiString): TIdBytes; overload; static;
    class function GetIdBytes(aSrc: string): TIdBytes; overload; static;
    class function ToBoolean(aBytes: TIdBytes; aOffset: Integer): Boolean; overload; static;
    class function ToShortInt(aBytes: TIdBytes; aOffset: Integer): ShortInt; overload; static;
    class function ToSmallInt(aBytes: TIdBytes; aOffset: Integer): SmallInt; overload; static;
    class function ToInteger(aBytes: TIdBytes; aOffset: Integer): Integer; overload; static;
    class function ToInt64(aBytes: TIdBytes; aOffset: Integer): Int64; overload; static;
    class function ToWord(aBytes: TIdBytes; aOffset: Integer): Word; overload; static;
    class function ToCardinal(aBytes: TIdBytes; aOffset: Integer): Cardinal; overload; static;
    class function ToUInt64(aBytes: TIdBytes; aOffset: Integer): UInt64; overload; static;
    class function ToSingle(aBytes: TIdBytes; aOffset: Integer): Single; overload; static;
    class function ToDouble(aBytes: TIdBytes; aOffset: Integer): Double; overload; static;
    class function ToAnsiChar(aBytes: TIdBytes; aOffset: Integer): AnsiChar; overload; static;
    class function ToChar(aBytes: TIdBytes; aOffset: Integer): Char; overload; static;
    class function ToAnsiStr(aBytes: TIdBytes): AnsiString; overload; static;
    class function ToAnsiStr(aBytes: TIdBytes; aOffset: Integer): AnsiString; overload; static;
    class function ToAnsiStr(aBytes: TIdBytes; aOffset, aLength: Integer): AnsiString; overload; static;
    class function ToStr(aBytes: TIdBytes): string; overload; static;
    class function ToStr(aBytes: TIdBytes; aOffset: Integer): string; overload; static;
    class function ToStr(aBytes: TIdBytes; aOffset, aLength: Integer): string; overload; static;
    {$ENDIF IndyCompat}
  end;

implementation

class function TByteConverter.GetBytes(aSrc: PByte; aLength: Integer): TBytes;
var
  I: Integer;
begin
  SetLength(Result, aLength);

  for I := 0 to aLength - 1 do
    if TByteConverter.fNeedEndianSwap then
      Result[aLength - (I + 1)] := aSrc[I]
    else
      Result[I] := aSrc[I];
end;

class procedure TByteConverter.PutBytes(var aDest: PByte; aBytes: TBytes; aOffset, aLength: Integer);
var
  I: Integer;
begin
  if aBytes = nil then
    raise EArgumentNilException.Create('aBytes is nil');

  if (aOffset < 0) or (aOffset > Length(aBytes) - 1) then
    raise EArgumentOutOfRangeException.Create(
      'aOffset was out of range.' + sLineBreak +
      'Must be non-negative and less than the size of the collection.'
    );

  if (Length(aBytes) - aLength < aOffset) then
    raise EArgumentException.Create(
      'Destination is not long enough to copy all the items in the collection.' + sLineBreak +
      'Check aOffset and aLength.'
    );

  for I := 0 to aLength - 1 do
    if TByteConverter.fNeedEndianSwap then
      aDest[aLength - (I + 1)] := aBytes[I + aOffset]
    else
      aDest[I] := aBytes[I + aOffset];
end;

class function TByteConverter.DoubleToInt64Bits(aValue: Double): Int64;
begin
  Result := TByteConverter.ToInt64(TByteConverter.GetBytes(aValue), 0);
end;

class function TByteConverter.Int64BitsToDouble(aValue: Int64): Double;
begin
  Result := TByteConverter.ToDouble(TByteConverter.GetBytes(aValue), 0);
end;

class function TByteConverter.GetBytes(aSrc: Boolean): TBytes;
begin
  if aSrc then
    Result := TBytes.Create(1)
  else
    Result := TBytes.Create(0);
end;

class function TByteConverter.GetBytes(aSrc: ShortInt): TBytes;
var
  Buff: PByte;
begin
  Buff := @aSrc;
  Result := TByteConverter.GetBytes(Buff, SizeOf(ShortInt));
end;

class function TByteConverter.GetBytes(aSrc: SmallInt): TBytes;
var
  Buff: PByte;
begin
  Buff := @aSrc;
  Result := TByteConverter.GetBytes(Buff, SizeOf(SmallInt));
end;

class function TByteConverter.GetBytes(aSrc: Integer): TBytes;
var
  Buff: PByte;
begin
  Buff := @aSrc;
  Result := TByteConverter.GetBytes(Buff, SizeOf(Integer));
end;

class function TByteConverter.GetBytes(aSrc: Int64): TBytes;
var
  Buff: PByte;
begin
  Buff := @aSrc;
  Result := TByteConverter.GetBytes(Buff, SizeOf(Int64));
end;

class function TByteConverter.GetBytes(aSrc: Word): TBytes;
var
  Buff: PByte;
begin
  Buff := @aSrc;
  Result := TByteConverter.GetBytes(Buff, SizeOf(Word));
end;

class function TByteConverter.GetBytes(aSrc: Cardinal): TBytes;
var
  Buff: PByte;
begin
  Buff := @aSrc;
  Result := TByteConverter.GetBytes(Buff, SizeOf(Cardinal));
end;

class function TByteConverter.GetBytes(aSrc: UInt64): TBytes;
var
  Buff: PByte;
begin
  Buff := @aSrc;
  Result := TByteConverter.GetBytes(Buff, SizeOf(UInt64));
end;

class function TByteConverter.GetBytes(aSrc: Single): TBytes;
var
  Buff: PByte;
begin
  Buff := @aSrc;
  Result := TByteConverter.GetBytes(Buff, SizeOf(Single));
end;

class function TByteConverter.GetBytes(aSrc: Double): TBytes;
const
  Count: Integer = SizeOf(Double);
var
  Buff: array[0..SizeOf(Double) - 1] of Byte absolute aSrc;
begin
  SetLength(Result, Count);
  Result := Copy(TBytes(@Buff), 0, Count);
end;

class function TByteConverter.GetBytes(aSrc: AnsiChar): TBytes;
var
  Buff: PByte;
begin
  Buff := @aSrc;
  Result := TByteConverter.GetBytes(Buff, SizeOf(AnsiChar));
end;

class function TByteConverter.GetBytes(aSrc: Char): TBytes;
var
  Buff: PByte;
begin
  Buff := @aSrc;
  Result := TByteConverter.GetBytes(Buff, SizeOf(Char));
end;

class function TByteConverter.GetBytes(aSrc: AnsiString): TBytes;
var
  Buff: PByte;
begin
  Buff := @aSrc;
  Result := TByteConverter.GetBytes(Buff, Length(aSrc) * SizeOf(AnsiChar));
end;

class function TByteConverter.GetBytes(aSrc: string): TBytes;
var
  Buff: PByte;
begin
  Buff := @aSrc;
  Result := TByteConverter.GetBytes(Buff, Length(aSrc) * SizeOf(Char));
end;

class function TByteConverter.ToBoolean(aBytes: TBytes; aOffset: Integer): Boolean;
begin
  if aBytes = nil then
    raise EArgumentNilException.Create('aBytes is nil');

  if (aOffset < 0) or (aOffset > Length(aBytes) - 1) then
    raise EArgumentOutOfRangeException.Create(
      'aOffset was out of range.' + sLineBreak +
      'Must be non-negative and less than the size of the collection.'
    );

  Result := not (aBytes[aOffset] = 0);
end;

class function TByteConverter.ToShortInt(aBytes: TBytes; aOffset: Integer): ShortInt;
const
  Count: Integer = SizeOf(ShortInt);
var
  Buff: PByte;
begin
  Buff := @Result;
  TByteConverter.PutBytes(Buff, aBytes, aOffset, Count);
end;

class function TByteConverter.ToSmallInt(aBytes: TBytes; aOffset: Integer): SmallInt;
const
  Count: Integer = SizeOf(SmallInt);
var
  Buff: PByte;
begin
  Buff := @Result;
  TByteConverter.PutBytes(Buff, aBytes, aOffset, Count);
end;

class function TByteConverter.ToInteger(aBytes: TBytes; aOffset: Integer): Integer;
const
  Count: Integer = SizeOf(Integer);
var
  Buff: PByte;
begin
  Buff := @Result;
  TByteConverter.PutBytes(Buff, aBytes, aOffset, Count);
end;

class function TByteConverter.ToInt64(aBytes: TBytes; aOffset: Integer): Int64;
const
  Count: Integer = SizeOf(Int64);
var
  Buff: PByte;
begin
  Buff := @Result;
  TByteConverter.PutBytes(Buff, aBytes, aOffset, Count);
end;

class function TByteConverter.ToWord(aBytes: TBytes; aOffset: Integer): Word;
const
  Count: Integer = SizeOf(Word);
var
  Buff: PByte;
begin
  Buff := @Result;
  TByteConverter.PutBytes(Buff, aBytes, aOffset, Count);
end;

class function TByteConverter.ToCardinal(aBytes: TBytes; aOffset: Integer): Cardinal;
const
  Count: Integer = SizeOf(Cardinal);
var
  Buff: PByte;
begin
  Buff := @Result;
  TByteConverter.PutBytes(Buff, aBytes, aOffset, Count);
end;

class function TByteConverter.ToUInt64(aBytes: TBytes; aOffset: Integer): UInt64;
const
  Count: Integer = SizeOf(UInt64);
var
  Buff: PByte;
begin
  Buff := @Result;
  TByteConverter.PutBytes(Buff, aBytes, aOffset, Count);
end;

class function TByteConverter.ToSingle(aBytes: TBytes; aOffset: Integer): Single;
const
  Count: Integer = SizeOf(Single);
var
  Buff: PByte;
begin
  Buff := @Result;
  TByteConverter.PutBytes(Buff, aBytes, aOffset, Count);
end;

class function TByteConverter.ToDouble(aBytes: TBytes; aOffset: Integer): Double;
const
  Count: Integer = SizeOf(Double);
var
  Buff: PByte;
begin
  Buff := @Result;
  TByteConverter.PutBytes(Buff, aBytes, aOffset, Count);
end;

class function TByteConverter.ToAnsiChar(aBytes: TBytes; aOffset: Integer): AnsiChar;
const
  Count: Integer = SizeOf(AnsiChar);
var
  Buff: PByte;
  Temp: Boolean;
begin
  Buff                          := @Result;
  Temp                          := TByteConverter.NeedEndianSwap;
  TByteConverter.NeedEndianSwap := False;
  TByteConverter.PutBytes(Buff, aBytes, aOffset, Count);
  TByteConverter.NeedEndianSwap := Temp;
end;

class function TByteConverter.ToChar(aBytes: TBytes; aOffset: Integer): Char;
const
  Count: Integer = SizeOf(Char);
var
  Buff: PByte;
  Temp: Boolean;
begin
  Buff                          := @Result;
  Temp                          := TByteConverter.NeedEndianSwap;
  TByteConverter.NeedEndianSwap := False;
  TByteConverter.PutBytes(Buff, aBytes, aOffset, Count);
  TByteConverter.NeedEndianSwap := Temp;
end;

class function TByteConverter.ToAnsiStr(aBytes: TBytes): AnsiString;
begin
  Result := TByteConverter.ToAnsiStr(aBytes, 0, Length(aBytes));
end;

class function TByteConverter.ToAnsiStr(aBytes: TBytes; aOffset: Integer): AnsiString;
begin
  Result := TByteConverter.ToAnsiStr(aBytes, aOffset, Length(aBytes) - aOffset);
end;

class function TByteConverter.ToAnsiStr(aBytes: TBytes; aOffset, aLength: Integer): AnsiString;
begin
  if aBytes = nil then
    raise EArgumentNilException.Create('aBytes is nil');

  if (aOffset < 0) or (aOffset > Length(aBytes) - 1) then
    raise EArgumentOutOfRangeException.Create(
      'aOffset was out of range.' + sLineBreak +
      'Must be non-negative and less than the size of the collection.'
    );

  SetString(Result, PAnsiChar(@aBytes[aOffset]), aLength);
end;

class function TByteConverter.ToStr(aBytes: TBytes): string;
begin
  Result := TByteConverter.ToStr(aBytes, 0, Length(aBytes));
end;

class function TByteConverter.ToStr(aBytes: TBytes; aOffset: Integer): string;
begin
  Result := TByteConverter.ToStr(aBytes, aOffset, Length(aBytes) - aOffset);
end;

class function TByteConverter.ToStr(aBytes: TBytes; aOffset, aLength: Integer): string;
begin
  if aBytes = nil then
    raise EArgumentNilException.Create('aBytes is nil');

  if (aOffset < 0) or (aOffset > Length(aBytes) - 1) then
    raise EArgumentOutOfRangeException.Create(
      'aOffset was out of range.' + sLineBreak +
      'Must be non-negative and less than the size of the collection.'
    );

  SetString(Result, PChar(@aBytes[aOffset]), aLength);
end;

{$IFDEF IndyCompat}
class function TByteConverter.GetIdBytes(aSrc: Boolean): TIdBytes;
begin
  if aSrc then
    Result := TIdBytes.Create(1)
  else
    Result := TIdBytes.Create(0);
end;

class function TByteConverter.GetIdBytes(aSrc: ShortInt): TIdBytes;
var
  Buff: PByte;
begin
  Buff := @aSrc;
  Result := TIdBytes(TByteConverter.GetBytes(Buff, SizeOf(ShortInt)));
end;

class function TByteConverter.GetIdBytes(aSrc: SmallInt): TIdBytes;
var
  Buff: PByte;
begin
  Buff := @aSrc;
  Result := TIdBytes(TByteConverter.GetBytes(Buff, SizeOf(SmallInt)));
end;

class function TByteConverter.GetIdBytes(aSrc: Integer): TIdBytes;
var
  Buff: PByte;
begin
  Buff := @aSrc;
  Result := TIdBytes(TByteConverter.GetBytes(Buff, SizeOf(Integer)));
end;

class function TByteConverter.GetIdBytes(aSrc: Int64): TIdBytes;
var
  Buff: PByte;
begin
  Buff := @aSrc;
  Result := TIdBytes(TByteConverter.GetBytes(Buff, SizeOf(Int64)));
end;

class function TByteConverter.GetIdBytes(aSrc: Word): TIdBytes;
var
  Buff: PByte;
begin
  Buff := @aSrc;
  Result := TIdBytes(TByteConverter.GetBytes(Buff, SizeOf(Word)));
end;

class function TByteConverter.GetIdBytes(aSrc: Cardinal): TIdBytes;
var
  Buff: PByte;
begin
  Buff := @aSrc;
  Result := TIdBytes(TByteConverter.GetBytes(Buff, SizeOf(Cardinal)));
end;

class function TByteConverter.GetIdBytes(aSrc: UInt64): TIdBytes;
var
  Buff: PByte;
begin
  Buff := @aSrc;
  Result := TIdBytes(TByteConverter.GetBytes(Buff, SizeOf(UInt64)));
end;

class function TByteConverter.GetIdBytes(aSrc: Single): TIdBytes;
var
  Buff: PByte;
begin
  Buff := @aSrc;
  Result := TIdBytes(TByteConverter.GetBytes(Buff, SizeOf(Single)));
end;

class function TByteConverter.GetIdBytes(aSrc: Double): TIdBytes;
const
  Count: Integer = SizeOf(Double);
var
  Buff: array[0..SizeOf(Double) - 1] of Byte absolute aSrc;
begin
  SetLength(Result, Count);
  Result := Copy(TIdBytes(@Buff), 0, Count);
end;

class function TByteConverter.GetIdBytes(aSrc: AnsiChar): TIdBytes;
var
  Buff: PByte;
begin
  Buff := @aSrc;
  Result := TIdBytes(TByteConverter.GetBytes(Buff, SizeOf(AnsiChar)));
end;

class function TByteConverter.GetIdBytes(aSrc: Char): TIdBytes;
var
  Buff: PByte;
begin
  Buff := @aSrc;
  Result := TIdBytes(TByteConverter.GetBytes(Buff, SizeOf(Char)));
end;

class function TByteConverter.GetIdBytes(aSrc: AnsiString): TIdBytes;
var
  Buff: PByte;
begin
  Buff := @aSrc;
  Result := TIdBytes(TByteConverter.GetBytes(Buff, Length(aSrc) * SizeOf(AnsiChar)));
end;

class function TByteConverter.GetIdBytes(aSrc: string): TIdBytes;
var
  Buff: PByte;
begin
  Buff := @aSrc;
  Result := TIdBytes(TByteConverter.GetBytes(Buff, Length(aSrc) * SizeOf(Char)));
end;

class function TByteConverter.ToBoolean(aBytes: TIdBytes; aOffset: Integer): Boolean;
begin
  Result := TByteConverter.ToBoolean(TBytes(aBytes), aOffset);
end;

class function TByteConverter.ToShortInt(aBytes: TIdBytes; aOffset: Integer): ShortInt;
begin
  Result := TByteConverter.ToShortInt(TBytes(aBytes), aOffset);
end;

class function TByteConverter.ToSmallInt(aBytes: TIdBytes; aOffset: Integer): SmallInt;
begin
  Result := TByteConverter.ToSmallInt(TBytes(aBytes), aOffset);
end;

class function TByteConverter.ToInteger(aBytes: TIdBytes; aOffset: Integer): Integer;
begin
  Result := TByteConverter.ToInteger(TBytes(aBytes), aOffset);
end;

class function TByteConverter.ToInt64(aBytes: TIdBytes; aOffset: Integer): Int64;
begin
  Result := TByteConverter.ToInt64(TBytes(aBytes), aOffset);
end;

class function TByteConverter.ToWord(aBytes: TIdBytes; aOffset: Integer): Word;
begin
  Result := TByteConverter.ToWord(TBytes(aBytes), aOffset);
end;

class function TByteConverter.ToCardinal(aBytes: TIdBytes; aOffset: Integer): Cardinal;
begin
  Result := TByteConverter.ToCardinal(TBytes(aBytes), aOffset);
end;

class function TByteConverter.ToUInt64(aBytes: TIdBytes; aOffset: Integer): UInt64;
begin
  Result := TByteConverter.ToUInt64(TBytes(aBytes), aOffset);
end;

class function TByteConverter.ToSingle(aBytes: TIdBytes; aOffset: Integer): Single;
begin
  Result := TByteConverter.ToSingle(TBytes(aBytes), aOffset);
end;

class function TByteConverter.ToDouble(aBytes: TIdBytes; aOffset: Integer): Double;
begin
  Result := TByteConverter.ToDouble(TBytes(aBytes), aOffset);
end;

class function TByteConverter.ToAnsiChar(aBytes: TIdBytes; aOffset: Integer): AnsiChar;
begin
  Result := TByteConverter.ToAnsiChar(TBytes(aBytes), aOffset);
end;

class function TByteConverter.ToChar(aBytes: TIdBytes; aOffset: Integer): Char;
begin
  Result := TByteConverter.ToChar(TBytes(aBytes), aOffset);
end;

class function TByteConverter.ToAnsiStr(aBytes: TIdBytes): AnsiString;
begin
  Result := TByteConverter.ToAnsiStr(TBytes(aBytes), 0, Length(aBytes));
end;

class function TByteConverter.ToAnsiStr(aBytes: TIdBytes; aOffset: Integer): AnsiString;
begin
  Result := TByteConverter.ToAnsiStr(TBytes(aBytes), aOffset, Length(aBytes) - aOffset);
end;

class function TByteConverter.ToAnsiStr(aBytes: TIdBytes; aOffset, aLength: Integer): AnsiString;
begin
  Result := TByteConverter.ToAnsiStr(TBytes(aBytes), aOffset, aLength);
end;

class function TByteConverter.ToStr(aBytes: TIdBytes): string;
begin
  Result := TByteConverter.ToStr(TBytes(aBytes), 0, Length(aBytes));
end;

class function TByteConverter.ToStr(aBytes: TIdBytes; aOffset: Integer): string;
begin
  Result := TByteConverter.ToStr(TBytes(aBytes), aOffset, Length(aBytes) - aOffset);
end;

class function TByteConverter.ToStr(aBytes: TIdBytes; aOffset, aLength: Integer): string;
begin
  Result := TByteConverter.ToStr(TBytes(aBytes), aOffset, aLength);
end;
{$ENDIF IndyCompat}

end.
