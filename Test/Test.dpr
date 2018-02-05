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
program Test;
{$APPTYPE CONSOLE}
{$R *.res}
uses
  SysUtils, Windows,
  DByteArrayCompat in '..\DByteArrayCompat.pas';

function KeyPressed(aHandle: THandle): Boolean;
var
  NumEvents,
  NumEventsRead: DWORD;
  Buff:          TInputRecord;
begin
  Result    := False;
  NumEvents := 0;
  GetNumberOfConsoleInputEvents(aHandle, NumEvents);

  if NumEvents <> 0 then
  begin
    PeekConsoleInput(aHandle, Buff, 1, NumEventsRead);

    if NumEventsRead <> 0 then
    begin
      if Buff.EventType = KEY_EVENT then
      begin
        if Buff.Event.KeyEvent.bKeyDown then
          Result := true
        else
          FlushConsoleInputBuffer(aHandle);
      end else
        FlushConsoleInputBuffer(aHandle);
    end;
  end;
end;

var
  inHandle,
  outHandle:  THandle;
  errorCount: Integer;
  buff:       TBytes;
  testBool:   Boolean;
  testShI:    ShortInt;
  testSmI:    SmallInt;
  testI:      Integer;
  testI64:    Int64;
  testW:      Word;
  testC:      Cardinal;
  testUI64:   UInt64;
  testS:      Single;
  testD:      Double;
  testACh:    AnsiChar;
  testCh:     Char;
  testAStr:   AnsiString;
  testStr:    string;
begin
  try
    inHandle   := GetStdHandle(STD_INPUT_HANDLE);
    outHandle  := GetStdHandle(STD_OUTPUT_HANDLE);
    errorCount := 0;

    FlushConsoleInputBuffer(inHandle);
    SetConsoleTextAttribute(outHandle, 7);
    WriteLn('  //========================================================================\\  ');
    WriteLn('  ||                       DByteArrayCompat Test Util                       ||  ');
    WriteLn('  ||========================================================================||  ');
    WriteLn('  ||                                                                        ||  ');
    WriteLn('  ||            This is a test util for the DByteArrayCompat lib            ||  ');
    WriteLn('  || This util SHOULD not be used as reference for building any kind of app ||  ');
    WriteLn('  ||                                                                        ||  ');
    WriteLn('  \\========================================================================//  ');
    WriteLn;
    WriteLn('  Press any key to continue');
    WriteLn;

    while not KeyPressed(inHandle) do
      Sleep(10);

    { Boolean Test }
    try
      try
        testBool := False;
        buff     := TByteConverter.GetBytes(testBool);
        testBool := TByteConverter.ToBoolean(buff, 0);

        if testBool <> False then
          raise Exception.Create('testBool');

        testBool := True;
        buff     := TByteConverter.GetBytes(testBool);
        testBool := TByteConverter.ToBoolean(buff, 0);

        if testBool <> True then
          raise Exception.Create('testBool');

        SetConsoleTextAttribute(
          outHandle,
          FOREGROUND_GREEN
        );
        Write('  PASSED');
      except
        on E:Exception do
        begin
          Inc(errorCount);
          SetConsoleTextAttribute(
            outHandle,
            FOREGROUND_RED
          );
          Write('  FAILED');
        end;
      end;
    finally
      SetConsoleTextAttribute(outHandle, 7);
      WriteLn(' - Boolean test');
    end;

    { ShortInt Test }
    try
      try
        testShI := ShortInt.MinValue;
        buff    := TByteConverter.GetBytes(testShI);
        testShI := TByteConverter.ToShortInt(buff, 0);

        if testShI <> ShortInt.MinValue then
          raise Exception.Create('testShI');

        testShI := 0;
        buff    := TByteConverter.GetBytes(testShI);
        testShI := TByteConverter.ToShortInt(buff, 0);

        if testShI <> 0 then
          raise Exception.Create('testShI');

        testShI := ShortInt.MaxValue;
        buff    := TByteConverter.GetBytes(testShI);
        testShI := TByteConverter.ToShortInt(buff, 0);

        if testShI <> ShortInt.MaxValue then
          raise Exception.Create('testShI');

        SetConsoleTextAttribute(
          outHandle,
          FOREGROUND_GREEN
        );
        Write('  PASSED');
      except
        on E:Exception do
        begin
          Inc(errorCount);
          SetConsoleTextAttribute(
            outHandle,
            FOREGROUND_RED
          );
          Write('  FAILED');
        end;
      end;
    finally
      SetConsoleTextAttribute(outHandle, 7);
      WriteLn(' - ShortInt test');
    end;

    { SmallInt Test }
    try
      try
        testSmI := SmallInt.MinValue;
        buff    := TByteConverter.GetBytes(testSmI);
        testSmI := TByteConverter.ToSmallInt(buff, 0);

        if testSmI <> SmallInt.MinValue then
          raise Exception.Create('testSmI');

        testSmI := 0;
        buff    := TByteConverter.GetBytes(testSmI);
        testSmI := TByteConverter.ToSmallInt(buff, 0);

        if testSmI <> 0 then
          raise Exception.Create('testSmI');

        testSmI := SmallInt.MaxValue;
        buff    := TByteConverter.GetBytes(testSmI);
        testSmI := TByteConverter.ToSmallInt(buff, 0);

        if testSmI <> SmallInt.MaxValue then
          raise Exception.Create('testSmI');

        SetConsoleTextAttribute(
          outHandle,
          FOREGROUND_GREEN
        );
        Write('  PASSED');
      except
        on E:Exception do
        begin
          Inc(errorCount);
          SetConsoleTextAttribute(
            outHandle,
            FOREGROUND_RED
          );
          Write('  FAILED');
        end;
      end;
    finally
      SetConsoleTextAttribute(outHandle, 7);
      WriteLn(' - SmallInt test');
    end;

    { Integer Test }
    try
      try
        testI := Integer.MinValue;
        buff  := TByteConverter.GetBytes(testI);
        testI := TByteConverter.ToInteger(buff, 0);

        if testI <> Integer.MinValue then
          raise Exception.Create('testI');

        testI := 0;
        buff  := TByteConverter.GetBytes(testI);
        testI := TByteConverter.ToInteger(buff, 0);

        if testI <> 0 then
          raise Exception.Create('testI');

        testI := Integer.MaxValue;
        buff  := TByteConverter.GetBytes(testI);
        testI := TByteConverter.ToInteger(buff, 0);

        if testI <> Integer.MaxValue then
          raise Exception.Create('testI');

        SetConsoleTextAttribute(
          outHandle,
          FOREGROUND_GREEN
        );
        Write('  PASSED');
      except
        on E:Exception do
        begin
          Inc(errorCount);
          SetConsoleTextAttribute(
            outHandle,
            FOREGROUND_RED
          );
          Write('  FAILED');
        end;
      end;
    finally
      SetConsoleTextAttribute(outHandle, 7);
      WriteLn(' - Integer test');
    end;

    { Int64 Test }
    try
      try
        testI64 := Int64.MinValue;
        buff    := TByteConverter.GetBytes(testI64);
        testI64 := TByteConverter.ToInt64(buff, 0);

        if testI64 <> Int64.MinValue then
          raise Exception.Create('testI64');

        testI64 := 0;
        buff    := TByteConverter.GetBytes(testI64);
        testI64 := TByteConverter.ToInt64(buff, 0);

        if testI64 <> 0 then
          raise Exception.Create('testI64');

        testI64 := Int64.MaxValue;
        buff    := TByteConverter.GetBytes(testI64);
        testI64 := TByteConverter.ToInt64(buff, 0);

        if testI64 <> Int64.MaxValue then
          raise Exception.Create('testI64');

        SetConsoleTextAttribute(
          outHandle,
          FOREGROUND_GREEN
        );
        Write('  PASSED');
      except
        on E:Exception do
        begin
          Inc(errorCount);
          SetConsoleTextAttribute(
            outHandle,
            FOREGROUND_RED
          );
          Write('  FAILED');
        end;
      end;
    finally
      SetConsoleTextAttribute(outHandle, 7);
      WriteLn(' - Int64 test');
    end;

    { Word Test }
    try
      try
        testW := Word.MinValue;
        buff  := TByteConverter.GetBytes(testW);
        testW := TByteConverter.ToWord(buff, 0);

        if testW <> Word.MinValue then
          raise Exception.Create('testW');

        testW := Word.MaxValue;
        buff  := TByteConverter.GetBytes(testW);
        testW := TByteConverter.ToShortInt(buff, 0);

        if testW <> Word.MaxValue then
          raise Exception.Create('testW');

        SetConsoleTextAttribute(
          outHandle,
          FOREGROUND_GREEN
        );
        Write('  PASSED');
      except
        on E:Exception do
        begin
          Inc(errorCount);
          SetConsoleTextAttribute(
            outHandle,
            FOREGROUND_RED
          );
          Write('  FAILED');
        end;
      end;
    finally
      SetConsoleTextAttribute(outHandle, 7);
      WriteLn(' - Word test');
    end;

    { Cardinal Test }
    try
      try
        testC := Cardinal.MinValue;
        buff  := TByteConverter.GetBytes(testC);
        testC := TByteConverter.ToCardinal(buff, 0);

        if testC <> Cardinal.MinValue then
          raise Exception.Create('testC');

        testC := Cardinal.MaxValue;
        buff  := TByteConverter.GetBytes(testC);
        testC := TByteConverter.ToCardinal(buff, 0);

        if testC <> Cardinal.MaxValue then
          raise Exception.Create('testC');

        SetConsoleTextAttribute(
          outHandle,
          FOREGROUND_GREEN
        );
        Write('  PASSED');
      except
        on E:Exception do
        begin
          Inc(errorCount);
          SetConsoleTextAttribute(
            outHandle,
            FOREGROUND_RED
          );
          Write('  FAILED');
        end;
      end;
    finally
      SetConsoleTextAttribute(outHandle, 7);
      WriteLn(' - Cardinal test');
    end;

    { UInt64 Test }
    try
      try
        testUI64 := UInt64.MinValue;
        buff     := TByteConverter.GetBytes(testUI64);
        testUI64 := TByteConverter.ToUInt64(buff, 0);

        if testUI64 <> UInt64.MinValue then
          raise Exception.Create('testUI64');

        testUI64 := UInt64.MaxValue;
        buff     := TByteConverter.GetBytes(testUI64);
        testUI64 := TByteConverter.ToUInt64(buff, 0);

        if testUI64 <> UInt64.MaxValue then
          raise Exception.Create('testUI64');

        SetConsoleTextAttribute(
          outHandle,
          FOREGROUND_GREEN
        );
        Write('  PASSED');
      except
        on E:Exception do
        begin
          Inc(errorCount);
          SetConsoleTextAttribute(
            outHandle,
            FOREGROUND_RED
          );
          Write('  FAILED');
        end;
      end;
    finally
      SetConsoleTextAttribute(outHandle, 7);
      WriteLn(' - UInt64 test');
    end;

    { Single Test }
    try
      try
        testS := Single.MinValue;
        buff  := TByteConverter.GetBytes(testS);
        testS := TByteConverter.ToSingle(buff, 0);

        if testS <> Single.MinValue then
          raise Exception.Create('testS');

        testS := 0;
        buff  := TByteConverter.GetBytes(testS);
        testS := TByteConverter.ToSingle(buff, 0);

        if testS <> 0 then
          raise Exception.Create('testS');

        testS := Single.MaxValue;
        buff  := TByteConverter.GetBytes(testS);
        testS := TByteConverter.ToSingle(buff, 0);

        if testS <> Single.MaxValue then
          raise Exception.Create('testS');

        SetConsoleTextAttribute(
          outHandle,
          FOREGROUND_GREEN
        );
        Write('  PASSED');
      except
        on E:Exception do
        begin
          Inc(errorCount);
          SetConsoleTextAttribute(
            outHandle,
            FOREGROUND_RED
          );
          Write('  FAILED');
        end;
      end;
    finally
      SetConsoleTextAttribute(outHandle, 7);
      WriteLn(' - Single test');
    end;

    { Double Test }
    try
      try
        testD := Double.MinValue;
        buff  := TByteConverter.GetBytes(testD);
        testD := TByteConverter.ToDouble(buff, 0);

        if testD <> Double.MinValue then
          raise Exception.Create('testD');

        testD := 0;
        buff  := TByteConverter.GetBytes(testD);
        testD := TByteConverter.ToDouble(buff, 0);

        if testD <> 0 then
          raise Exception.Create('testD');

        testD := Double.MaxValue;
        buff  := TByteConverter.GetBytes(testD);
        testD := TByteConverter.ToDouble(buff, 0);

        if testD <> Double.MaxValue then
          raise Exception.Create('testD');

        SetConsoleTextAttribute(
          outHandle,
          FOREGROUND_GREEN
        );
        Write('  PASSED');
      except
        on E:Exception do
        begin
          Inc(errorCount);
          SetConsoleTextAttribute(
            outHandle,
            FOREGROUND_RED
          );
          Write('  FAILED');
        end;
      end;
    finally
      SetConsoleTextAttribute(outHandle, 7);
      WriteLn(' - Double test');
    end;

    { AnsiChar Test }
    try
      try
        testACh := #0;
        buff    := TByteConverter.GetBytes(testACh);
        testACh := TByteConverter.ToAnsiChar(buff, 0);

        if testACh <> #0 then
          raise Exception.Create('testACh');

        testACh := 'A';
        buff    := TByteConverter.GetBytes(testACh);
        testACh := TByteConverter.ToAnsiChar(buff, 0);

        if testACh <> 'A' then
          raise Exception.Create('testACh');

        testACh := #255;
        buff    := TByteConverter.GetBytes(testACh);
        testACh := TByteConverter.ToAnsiChar(buff, 0);

        if testACh <> #255 then
          raise Exception.Create('testACh');

        SetConsoleTextAttribute(
          outHandle,
          FOREGROUND_GREEN
        );
        Write('  PASSED');
      except
        on E:Exception do
        begin
          Inc(errorCount);
          SetConsoleTextAttribute(
            outHandle,
            FOREGROUND_RED
          );
          Write('  FAILED');
        end;
      end;
    finally
      SetConsoleTextAttribute(outHandle, 7);
      WriteLn(' - AnsiChar test');
    end;

    { Char Test }
    try
      try
        testCh := #0;
        buff   := TByteConverter.GetBytes(testCh);
        testCh := TByteConverter.ToChar(buff, 0);

        if testCh <> #0 then
          raise Exception.Create('testCh');

        testCh := 'A';
        buff   := TByteConverter.GetBytes(testCh);
        testCh := TByteConverter.ToChar(buff, 0);

        if testCh <> 'A' then
          raise Exception.Create('testCh');

        testCh := #65535;
        buff   := TByteConverter.GetBytes(testCh);
        testCh := TByteConverter.ToChar(buff, 0);

        if testCh <> #65535 then
          raise Exception.Create('testCh');

        SetConsoleTextAttribute(
          outHandle,
          FOREGROUND_GREEN
        );
        Write('  PASSED');
      except
        on E:Exception do
        begin
          Inc(errorCount);
          SetConsoleTextAttribute(
            outHandle,
            FOREGROUND_RED
          );
          Write('  FAILED');
        end;
      end;
    finally
      SetConsoleTextAttribute(outHandle, 7);
      WriteLn(' - Char test');
    end;

    { AnsiString Test }
    try
      try
        testAStr := 'Test';
        buff     := TByteConverter.GetBytes(testAStr);
        testAStr := TByteConverter.ToAnsiStr(buff, 0);

        if testAStr <> 'Test' then
          raise Exception.Create('testAStr');

        SetConsoleTextAttribute(
          outHandle,
          FOREGROUND_GREEN
        );
        Write('  PASSED');
      except
        on E:Exception do
        begin
          Inc(errorCount);
          SetConsoleTextAttribute(
            outHandle,
            FOREGROUND_RED
          );
          Write('  FAILED');
        end;
      end;
    finally
      SetConsoleTextAttribute(outHandle, 7);
      WriteLn(' - AnsiString test');
    end;

    { String Test }
    try
      try
        testStr := 'Test';
        buff    := TByteConverter.GetBytes(testStr);
        testStr := TByteConverter.ToStr(buff, 0);

        if testStr <> 'Test' then
          raise Exception.Create('testStr');

        testStr := 'Контрольная работа';
        buff    := TByteConverter.GetBytes(testStr);
        testStr := TByteConverter.ToStr(buff, 0);

        if testStr <> 'Контрольная работа' then
          raise Exception.Create('testStr');

        testStr := 'テスト';
        buff    := TByteConverter.GetBytes(testStr);
        testStr := TByteConverter.ToStr(buff, 0);

        if testStr <> 'テスト' then
          raise Exception.Create('testStr');

        testStr := '測試';
        buff    := TByteConverter.GetBytes(testStr);
        testStr := TByteConverter.ToStr(buff, 0);

        if testStr <> '測試' then
          raise Exception.Create('testStr');

        SetConsoleTextAttribute(
          outHandle,
          FOREGROUND_GREEN
        );
        Write('  PASSED');
      except
        on E:Exception do
        begin
          Inc(errorCount);
          SetConsoleTextAttribute(
            outHandle,
            FOREGROUND_RED
          );
          Write('  FAILED');
        end;
      end;
    finally
      SetConsoleTextAttribute(outHandle, 7);
      WriteLn(' - String test');
    end;

    WriteLn;

    if errorCount <> 0 then
    begin
      SetConsoleTextAttribute(
        outHandle,
        FOREGROUND_RED
      );
      WriteLn('  ' + IntToStr(errorCount) + ' errors encountered during tests');
    end else
    begin
      SetConsoleTextAttribute(
        outHandle,
        FOREGROUND_GREEN
      );
      WriteLn('  No errors encountered during tests');
    end;

    FlushConsoleInputBuffer(inHandle);
    SetConsoleTextAttribute(outHandle, 7);
    WriteLn('  Press any key to continue');
    WriteLn;

    while not KeyPressed(inHandle) do
      Sleep(10);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
