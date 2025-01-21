
// This could be main() or main(args: Array<String>) similar to
// public void static main(<String> args){}
fun main(args: Array<String>) {

    //printFunctions();
    dataTypes();
    //conversions();
    //bitwiseOperations();
}

// println and print functions
fun printFunctions() {
    println("===========================================================");
    println("Print Functions");
    println("===========================================================");
    println("Hello world!");

    print("This is a ")
    print("print function text\n")
    println("This is a println function text")
}

fun dataTypes() {
    println("===========================================================");
    println("Data Types");
    println("===========================================================");

    println("+++++++++++++++++++++++++++++++++++++");
    println("Integer types");
    println("+++++++++++++++++++++++++++++++++++++");

    // Bits Size: 8 (-128,127)
    var integerTypesBits: Byte = 0;
    println("Byte $integerTypesBits");

    // Bits Size: 16 (-32,768  ,  32,767)
    var integerTypesShort: Short = 0;
    println("Short $integerTypesShort");

    // Bits	Size :32 (-2,147,483,648  ,  2,147,483,647)
    var integerTypesInt: Int = 0;
    println("Int $integerTypesInt");

    // Bits Size: 64 (-9,223,372,036,854,775,808  ,  9,223,372,036,854,775,807)
    var integerTypesLong: Long = 0;
    println("Long $integerTypesLong");

    println("+++++++++++++++++++++++++++++++++++++");
    println("Floating-point types");
    println("+++++++++++++++++++++++++++++++++++++");
    // Bits Size: 32 Decimals: 6-7
    var floatingPointTypesFloat: Float = 0.0f;
    println("Float $floatingPointTypesFloat");

    // Bits Size: 64 Decimals: 6-7
    var floatingPointTypesDouble: Double = 0.0;
    println("Double $floatingPointTypesDouble");

    println("+++++++++++++++++++++++++++++++++++++");
    println("Literal constants");
    println("+++++++++++++++++++++++++++++++++++++");

    val literalConstantsDecimals = 123_456_789L;
    println("Decimals $literalConstantsDecimals");

    val literalConstantsHexadecimals = 0x01F;
    println("Hexadecimals $literalConstantsHexadecimals");

    val literalConstantsBinaries = 0b0111;
    println("Binaries $literalConstantsBinaries");

    println("+++++++++++++++++++++++++++++++++++++");
    println("Booleans");
    println("+++++++++++++++++++++++++++++++++++++");
    var booleansTrue: Boolean = true;
    println("Booleans True $booleansTrue");

    var booleansFalse: Boolean = false;
    println("Booleans False $booleansFalse");

    var booleansNull: Boolean? = null;
    println("Booleans Null $booleansNull");

    println("+++++++++++++++++++++++++++++++++++++");
    println("Characters");
    println("+++++++++++++++++++++++++++++++++++++");
    var characters: Char = 'a';
    println("Characters leter $characters");

    characters = '\n';
    print("Characters break line $characters");

    characters =  '\uFF00'
    println("Characters special char $characters");

    println("+++++++++++++++++++++++++++++++++++++");
    println("Strings");
    println("+++++++++++++++++++++++++++++++++++++");

}
fun conversions(){
    println("===========================================================");
    println("Conversions");
    println("===========================================================");
    val y = 0;
    var yByte = y.toByte();
    var yShort = y.toShort();
    var yInt = y.toInt();
    var yLong = y.toLong();
    var yFloat = y.toFloat();
    var yDouble = y.toDouble();
    var yChar = y.toChar();
}

fun bitwiseOperations() {
    println("===========================================================");
    println("Bitwise operations");
    println("===========================================================");
    var n = 7;
    // signed shift left (move one bit to the left)
    //  S   8   4   2   1
    //  0   0   1   1   1   = 7
    // -------------------------
    //  0   1   1   1   0   = 14
    println("signed shift left " + n.shl(1));

    //signed shift right (move one bit to the right)
    //  S   8   4   2   1
    //  0   0   1   1   1   = 7
    // -------------------------
    //  0   0   0   1   1   = 3
    println("signed shift right " + n.shr(1));


    // unsigned shift right (move one bit to the right)
    //  S   8   4   2   1
    //  0   0   1   1   1   = 7
    // -------------------------
    //  0   0   0   1   1   = 3
    println("unsigned shift right " + n.ushr(1));

    // bitwise and (change to 1 when both are 1)
    //  S   8   4   2   1
    //  0   0   1   1   1   = 7
    //  0   0   0   0   1   = 1
    // -------------------------
    //  0   0   0   0   1   = 1
    println("bitwise and " + n.and(1));

    // bitwise or (change to 1 when one of them is 1 or both are 1)
    //  S   8   4   2   1
    //  0   0   1   1   1   = 7
    //  0   0   0   0   1   = 1
    // -------------------------
    //  0   0   1   1   1   = 7
    println("bitwise or " + n.or(1));

    // bitwise xor (change to 1 when one of them is 1)
    //  S   8   4   2   1
    //  0   0   1   1   1   = 7
    //  0   0   0   0   1   = 1
    // -------------------------
    //  0   0   1   1   0   = 6
    println("bitwise xor " + n.xor(1));

    // bitwise inversion (change 0 to 1 and 1 to 0)
    //  S   8   4   2   1
    //  0   0   1   1   1   = 7
    // -------------------------
    //  1   1   0   0   0   = -8
    println("bitwise inversion " + n.inv());

    n = -7;
    //  S   8   4   2   1
    //  1   0   1   1   1   = -7
    // -------------------------
    //  1   0   1   1   0   = 6
    println("bitwise inversion " + n.inv());

}