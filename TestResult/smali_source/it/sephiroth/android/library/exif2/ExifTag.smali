.class public Lit/sephiroth/android/library/exif2/ExifTag;
.super Ljava/lang/Object;
.source "ExifTag.java"


# static fields
.field private static final TIME_FORMAT:Ljava/text/SimpleDateFormat;

.field private static final TYPE_TO_SIZE_MAP:[I

.field private static US_ASCII:Ljava/nio/charset/Charset;


# instance fields
.field private mComponentCountActual:I

.field private final mDataType:S

.field private mHasDefinedDefaultComponentCount:Z

.field private mIfd:I

.field private mOffset:I

.field private final mTagId:S

.field private mValue:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/16 v5, 0x8

    const/4 v4, 0x2

    const/4 v3, 0x4

    const/4 v2, 0x1

    .line 70
    const/16 v0, 0xb

    new-array v0, v0, [I

    sput-object v0, Lit/sephiroth/android/library/exif2/ExifTag;->TYPE_TO_SIZE_MAP:[I

    .line 77
    sget-object v0, Lit/sephiroth/android/library/exif2/ExifTag;->TYPE_TO_SIZE_MAP:[I

    aput v2, v0, v2

    .line 78
    sget-object v0, Lit/sephiroth/android/library/exif2/ExifTag;->TYPE_TO_SIZE_MAP:[I

    aput v2, v0, v4

    .line 79
    sget-object v0, Lit/sephiroth/android/library/exif2/ExifTag;->TYPE_TO_SIZE_MAP:[I

    const/4 v1, 0x3

    aput v4, v0, v1

    .line 80
    sget-object v0, Lit/sephiroth/android/library/exif2/ExifTag;->TYPE_TO_SIZE_MAP:[I

    aput v3, v0, v3

    .line 81
    sget-object v0, Lit/sephiroth/android/library/exif2/ExifTag;->TYPE_TO_SIZE_MAP:[I

    const/4 v1, 0x5

    aput v5, v0, v1

    .line 82
    sget-object v0, Lit/sephiroth/android/library/exif2/ExifTag;->TYPE_TO_SIZE_MAP:[I

    const/4 v1, 0x7

    aput v2, v0, v1

    .line 83
    sget-object v0, Lit/sephiroth/android/library/exif2/ExifTag;->TYPE_TO_SIZE_MAP:[I

    const/16 v1, 0x9

    aput v3, v0, v1

    .line 84
    sget-object v0, Lit/sephiroth/android/library/exif2/ExifTag;->TYPE_TO_SIZE_MAP:[I

    const/16 v1, 0xa

    aput v5, v0, v1

    .line 86
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy:MM:dd kk:mm:ss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lit/sephiroth/android/library/exif2/ExifTag;->TIME_FORMAT:Ljava/text/SimpleDateFormat;

    .line 87
    const-string v0, "US-ASCII"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lit/sephiroth/android/library/exif2/ExifTag;->US_ASCII:Ljava/nio/charset/Charset;

    return-void
.end method

.method constructor <init>(SSIIZ)V
    .registers 7
    .param p1, "tagId"    # S
    .param p2, "type"    # S
    .param p3, "componentCount"    # I
    .param p4, "ifd"    # I
    .param p5, "hasDefinedComponentCount"    # Z

    .prologue
    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    iput-short p1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mTagId:S

    .line 107
    iput-short p2, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mDataType:S

    .line 108
    iput p3, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mComponentCountActual:I

    .line 109
    iput-boolean p5, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mHasDefinedDefaultComponentCount:Z

    .line 110
    iput p4, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mIfd:I

    .line 111
    const/4 v0, 0x0

    iput-object v0, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    .line 112
    return-void
.end method

.method private checkBadComponentCount(I)Z
    .registers 3
    .param p1, "count"    # I

    .prologue
    .line 537
    iget-boolean v0, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mHasDefinedDefaultComponentCount:Z

    if-eqz v0, :cond_a

    iget v0, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mComponentCountActual:I

    if-eq v0, p1, :cond_a

    .line 538
    const/4 v0, 0x1

    .line 540
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private checkOverflowForRational([Lit/sephiroth/android/library/exif2/Rational;)Z
    .registers 12
    .param p1, "value"    # [Lit/sephiroth/android/library/exif2/Rational;

    .prologue
    const-wide/32 v8, 0x7fffffff

    const-wide/32 v6, -0x80000000

    .line 917
    move-object v0, p1

    .local v0, "arr$":[Lit/sephiroth/android/library/exif2/Rational;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_9
    if-ge v1, v2, :cond_32

    aget-object v3, v0, v1

    .line 918
    .local v3, "v":Lit/sephiroth/android/library/exif2/Rational;
    invoke-virtual {v3}, Lit/sephiroth/android/library/exif2/Rational;->getNumerator()J

    move-result-wide v4

    cmp-long v4, v4, v6

    if-ltz v4, :cond_2d

    invoke-virtual {v3}, Lit/sephiroth/android/library/exif2/Rational;->getDenominator()J

    move-result-wide v4

    cmp-long v4, v4, v6

    if-ltz v4, :cond_2d

    invoke-virtual {v3}, Lit/sephiroth/android/library/exif2/Rational;->getNumerator()J

    move-result-wide v4

    cmp-long v4, v4, v8

    if-gtz v4, :cond_2d

    invoke-virtual {v3}, Lit/sephiroth/android/library/exif2/Rational;->getDenominator()J

    move-result-wide v4

    cmp-long v4, v4, v8

    if-lez v4, :cond_2f

    .line 919
    :cond_2d
    const/4 v4, 0x1

    .line 922
    .end local v3    # "v":Lit/sephiroth/android/library/exif2/Rational;
    :goto_2e
    return v4

    .line 917
    .restart local v3    # "v":Lit/sephiroth/android/library/exif2/Rational;
    :cond_2f
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 922
    .end local v3    # "v":Lit/sephiroth/android/library/exif2/Rational;
    :cond_32
    const/4 v4, 0x0

    goto :goto_2e
.end method

.method private checkOverflowForUnsignedLong([I)Z
    .registers 7
    .param p1, "value"    # [I

    .prologue
    .line 899
    move-object v0, p1

    .local v0, "arr$":[I
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_3
    if-ge v1, v2, :cond_e

    aget v3, v0, v1

    .line 900
    .local v3, "v":I
    if-gez v3, :cond_b

    .line 901
    const/4 v4, 0x1

    .line 904
    .end local v3    # "v":I
    :goto_a
    return v4

    .line 899
    .restart local v3    # "v":I
    :cond_b
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 904
    .end local v3    # "v":I
    :cond_e
    const/4 v4, 0x0

    goto :goto_a
.end method

.method private checkOverflowForUnsignedLong([J)Z
    .registers 10
    .param p1, "value"    # [J

    .prologue
    .line 890
    move-object v0, p1

    .local v0, "arr$":[J
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_3
    if-ge v1, v2, :cond_1b

    aget-wide v4, v0, v1

    .line 891
    .local v4, "v":J
    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-ltz v3, :cond_16

    const-wide v6, 0xffffffffL

    cmp-long v3, v4, v6

    if-lez v3, :cond_18

    .line 892
    :cond_16
    const/4 v3, 0x1

    .line 895
    .end local v4    # "v":J
    :goto_17
    return v3

    .line 890
    .restart local v4    # "v":J
    :cond_18
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 895
    .end local v4    # "v":J
    :cond_1b
    const/4 v3, 0x0

    goto :goto_17
.end method

.method private checkOverflowForUnsignedRational([Lit/sephiroth/android/library/exif2/Rational;)Z
    .registers 12
    .param p1, "value"    # [Lit/sephiroth/android/library/exif2/Rational;

    .prologue
    const-wide v8, 0xffffffffL

    const-wide/16 v6, 0x0

    .line 908
    move-object v0, p1

    .local v0, "arr$":[Lit/sephiroth/android/library/exif2/Rational;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_a
    if-ge v1, v2, :cond_33

    aget-object v3, v0, v1

    .line 909
    .local v3, "v":Lit/sephiroth/android/library/exif2/Rational;
    invoke-virtual {v3}, Lit/sephiroth/android/library/exif2/Rational;->getNumerator()J

    move-result-wide v4

    cmp-long v4, v4, v6

    if-ltz v4, :cond_2e

    invoke-virtual {v3}, Lit/sephiroth/android/library/exif2/Rational;->getDenominator()J

    move-result-wide v4

    cmp-long v4, v4, v6

    if-ltz v4, :cond_2e

    invoke-virtual {v3}, Lit/sephiroth/android/library/exif2/Rational;->getNumerator()J

    move-result-wide v4

    cmp-long v4, v4, v8

    if-gtz v4, :cond_2e

    invoke-virtual {v3}, Lit/sephiroth/android/library/exif2/Rational;->getDenominator()J

    move-result-wide v4

    cmp-long v4, v4, v8

    if-lez v4, :cond_30

    .line 910
    :cond_2e
    const/4 v4, 0x1

    .line 913
    .end local v3    # "v":Lit/sephiroth/android/library/exif2/Rational;
    :goto_2f
    return v4

    .line 908
    .restart local v3    # "v":Lit/sephiroth/android/library/exif2/Rational;
    :cond_30
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 913
    .end local v3    # "v":Lit/sephiroth/android/library/exif2/Rational;
    :cond_33
    const/4 v4, 0x0

    goto :goto_2f
.end method

.method private checkOverflowForUnsignedShort([I)Z
    .registers 7
    .param p1, "value"    # [I

    .prologue
    .line 881
    move-object v0, p1

    .local v0, "arr$":[I
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_3
    if-ge v1, v2, :cond_13

    aget v3, v0, v1

    .line 882
    .local v3, "v":I
    const v4, 0xffff

    if-gt v3, v4, :cond_e

    if-gez v3, :cond_10

    .line 883
    :cond_e
    const/4 v4, 0x1

    .line 886
    .end local v3    # "v":I
    :goto_f
    return v4

    .line 881
    .restart local v3    # "v":I
    :cond_10
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 886
    .end local v3    # "v":I
    :cond_13
    const/4 v4, 0x0

    goto :goto_f
.end method

.method private static convertTypeToString(S)Ljava/lang/String;
    .registers 2
    .param p0, "type"    # S

    .prologue
    .line 778
    packed-switch p0, :pswitch_data_1e

    .line 796
    :pswitch_3
    const-string v0, ""

    :goto_5
    return-object v0

    .line 780
    :pswitch_6
    const-string v0, "UNSIGNED_BYTE"

    goto :goto_5

    .line 782
    :pswitch_9
    const-string v0, "ASCII"

    goto :goto_5

    .line 784
    :pswitch_c
    const-string v0, "UNSIGNED_SHORT"

    goto :goto_5

    .line 786
    :pswitch_f
    const-string v0, "UNSIGNED_LONG"

    goto :goto_5

    .line 788
    :pswitch_12
    const-string v0, "UNSIGNED_RATIONAL"

    goto :goto_5

    .line 790
    :pswitch_15
    const-string v0, "UNDEFINED"

    goto :goto_5

    .line 792
    :pswitch_18
    const-string v0, "LONG"

    goto :goto_5

    .line 794
    :pswitch_1b
    const-string v0, "RATIONAL"

    goto :goto_5

    .line 778
    :pswitch_data_1e
    .packed-switch 0x1
        :pswitch_6
        :pswitch_9
        :pswitch_c
        :pswitch_f
        :pswitch_12
        :pswitch_3
        :pswitch_15
        :pswitch_3
        :pswitch_18
        :pswitch_1b
    .end packed-switch
.end method

.method public static getElementSize(S)I
    .registers 2
    .param p0, "type"    # S

    .prologue
    .line 184
    sget-object v0, Lit/sephiroth/android/library/exif2/ExifTag;->TYPE_TO_SIZE_MAP:[I

    aget v0, v0, p0

    return v0
.end method

.method public static isValidIfd(I)Z
    .registers 3
    .param p0, "ifdId"    # I

    .prologue
    const/4 v0, 0x1

    .line 118
    if-eqz p0, :cond_e

    if-eq p0, v0, :cond_e

    const/4 v1, 0x2

    if-eq p0, v1, :cond_e

    const/4 v1, 0x3

    if-eq p0, v1, :cond_e

    const/4 v1, 0x4

    if-ne p0, v1, :cond_f

    :cond_e
    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public static isValidType(S)Z
    .registers 3
    .param p0, "type"    # S

    .prologue
    const/4 v0, 0x1

    .line 125
    if-eq p0, v0, :cond_1a

    const/4 v1, 0x2

    if-eq p0, v1, :cond_1a

    const/4 v1, 0x3

    if-eq p0, v1, :cond_1a

    const/4 v1, 0x4

    if-eq p0, v1, :cond_1a

    const/4 v1, 0x5

    if-eq p0, v1, :cond_1a

    const/4 v1, 0x7

    if-eq p0, v1, :cond_1a

    const/16 v1, 0x9

    if-eq p0, v1, :cond_1a

    const/16 v1, 0xa

    if-ne p0, v1, :cond_1b

    :cond_1a
    :goto_1a
    return v0

    :cond_1b
    const/4 v0, 0x0

    goto :goto_1a
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 927
    if-nez p1, :cond_4

    .line 965
    :cond_3
    :goto_3
    return v1

    .line 930
    :cond_4
    instance-of v2, p1, Lit/sephiroth/android/library/exif2/ExifTag;

    if-eqz v2, :cond_3

    move-object v0, p1

    .line 931
    check-cast v0, Lit/sephiroth/android/library/exif2/ExifTag;

    .line 932
    .local v0, "tag":Lit/sephiroth/android/library/exif2/ExifTag;
    iget-short v2, v0, Lit/sephiroth/android/library/exif2/ExifTag;->mTagId:S

    iget-short v3, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mTagId:S

    if-ne v2, v3, :cond_3

    iget v2, v0, Lit/sephiroth/android/library/exif2/ExifTag;->mComponentCountActual:I

    iget v3, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mComponentCountActual:I

    if-ne v2, v3, :cond_3

    iget-short v2, v0, Lit/sephiroth/android/library/exif2/ExifTag;->mDataType:S

    iget-short v3, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mDataType:S

    if-ne v2, v3, :cond_3

    .line 935
    iget-object v2, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    if-eqz v2, :cond_86

    .line 936
    iget-object v2, v0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    if-eqz v2, :cond_3

    .line 939
    iget-object v2, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    instance-of v2, v2, [J

    if-eqz v2, :cond_42

    .line 940
    iget-object v2, v0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    instance-of v2, v2, [J

    if-eqz v2, :cond_3

    .line 943
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v1, [J

    check-cast v1, [J

    iget-object v2, v0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v2, [J

    check-cast v2, [J

    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([J[J)Z

    move-result v1

    goto :goto_3

    .line 945
    :cond_42
    iget-object v2, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    instance-of v2, v2, [Lit/sephiroth/android/library/exif2/Rational;

    if-eqz v2, :cond_5f

    .line 946
    iget-object v2, v0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    instance-of v2, v2, [Lit/sephiroth/android/library/exif2/Rational;

    if-eqz v2, :cond_3

    .line 949
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v1, [Lit/sephiroth/android/library/exif2/Rational;

    check-cast v1, [Lit/sephiroth/android/library/exif2/Rational;

    iget-object v2, v0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v2, [Lit/sephiroth/android/library/exif2/Rational;

    check-cast v2, [Lit/sephiroth/android/library/exif2/Rational;

    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v1

    goto :goto_3

    .line 951
    :cond_5f
    iget-object v2, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    instance-of v2, v2, [B

    if-eqz v2, :cond_7c

    .line 952
    iget-object v2, v0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    instance-of v2, v2, [B

    if-eqz v2, :cond_3

    .line 955
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v1, [B

    check-cast v1, [B

    iget-object v2, v0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v2, [B

    check-cast v2, [B

    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    goto :goto_3

    .line 958
    :cond_7c
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    iget-object v2, v0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto/16 :goto_3

    .line 962
    :cond_86
    iget-object v2, v0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    if-nez v2, :cond_3

    const/4 v1, 0x1

    goto/16 :goto_3
.end method

.method public forceGetValueAsString()Ljava/lang/String;
    .registers 5

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 978
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    if-nez v1, :cond_9

    .line 979
    const-string v1, ""

    .line 1012
    :goto_8
    return-object v1

    .line 981
    :cond_9
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    instance-of v1, v1, [B

    if-eqz v1, :cond_2e

    .line 982
    iget-short v1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mDataType:S

    const/4 v2, 0x2

    if-ne v1, v2, :cond_23

    .line 983
    new-instance v2, Ljava/lang/String;

    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v1, [B

    check-cast v1, [B

    sget-object v3, Lit/sephiroth/android/library/exif2/ExifTag;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-direct {v2, v1, v3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    move-object v1, v2

    goto :goto_8

    .line 986
    :cond_23
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v1, [B

    check-cast v1, [B

    invoke-static {v1}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object v1

    goto :goto_8

    .line 989
    :cond_2e
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    instance-of v1, v1, [J

    if-eqz v1, :cond_55

    .line 990
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v1, [J

    check-cast v1, [J

    array-length v1, v1

    if-ne v1, v3, :cond_4a

    .line 991
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v1, [J

    check-cast v1, [J

    aget-wide v2, v1, v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    goto :goto_8

    .line 994
    :cond_4a
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v1, [J

    check-cast v1, [J

    invoke-static {v1}, Ljava/util/Arrays;->toString([J)Ljava/lang/String;

    move-result-object v1

    goto :goto_8

    .line 997
    :cond_55
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    instance-of v1, v1, [Ljava/lang/Object;

    if-eqz v1, :cond_81

    .line 998
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v1, [Ljava/lang/Object;

    check-cast v1, [Ljava/lang/Object;

    array-length v1, v1

    if-ne v1, v3, :cond_76

    .line 999
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v1, [Ljava/lang/Object;

    check-cast v1, [Ljava/lang/Object;

    aget-object v0, v1, v2

    .line 1000
    .local v0, "val":Ljava/lang/Object;
    if-nez v0, :cond_71

    .line 1001
    const-string v1, ""

    goto :goto_8

    .line 1004
    :cond_71
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_8

    .line 1008
    .end local v0    # "val":Ljava/lang/Object;
    :cond_76
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v1, [Ljava/lang/Object;

    check-cast v1, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_8

    .line 1012
    :cond_81
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_8
.end method

.method protected forceSetComponentCount(I)V
    .registers 2
    .param p1, "count"    # I

    .prologue
    .line 208
    iput p1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mComponentCountActual:I

    .line 209
    return-void
.end method

.method protected getBytes([B)V
    .registers 4
    .param p1, "buf"    # [B

    .prologue
    .line 837
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lit/sephiroth/android/library/exif2/ExifTag;->getBytes([BII)V

    .line 838
    return-void
.end method

.method protected getBytes([BII)V
    .registers 7
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 851
    iget-short v0, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mDataType:S

    const/4 v1, 0x7

    if-eq v0, v1, :cond_29

    iget-short v0, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mDataType:S

    const/4 v1, 0x1

    if-eq v0, v1, :cond_29

    .line 852
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot get BYTE value from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-short v2, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mDataType:S

    invoke-static {v2}, Lit/sephiroth/android/library/exif2/ExifTag;->convertTypeToString(S)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 854
    :cond_29
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    const/4 v1, 0x0

    iget v2, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mComponentCountActual:I

    if-le p3, v2, :cond_32

    iget p3, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mComponentCountActual:I

    .end local p3    # "length":I
    :cond_32
    invoke-static {v0, v1, p1, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 855
    return-void
.end method

.method public getComponentCount()I
    .registers 2

    .prologue
    .line 168
    iget v0, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mComponentCountActual:I

    return v0
.end method

.method public getDataSize()I
    .registers 3

    .prologue
    .line 159
    invoke-virtual {p0}, Lit/sephiroth/android/library/exif2/ExifTag;->getComponentCount()I

    move-result v0

    invoke-virtual {p0}, Lit/sephiroth/android/library/exif2/ExifTag;->getDataType()S

    move-result v1

    invoke-static {v1}, Lit/sephiroth/android/library/exif2/ExifTag;->getElementSize(S)I

    move-result v1

    mul-int/2addr v0, v1

    return v0
.end method

.method public getDataType()S
    .registers 2

    .prologue
    .line 200
    iget-short v0, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mDataType:S

    return v0
.end method

.method public getIfd()I
    .registers 2

    .prologue
    .line 141
    iget v0, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mIfd:I

    return v0
.end method

.method protected getOffset()I
    .registers 2

    .prologue
    .line 862
    iget v0, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mOffset:I

    return v0
.end method

.method protected getRational(I)Lit/sephiroth/android/library/exif2/Rational;
    .registers 5
    .param p1, "index"    # I

    .prologue
    .line 827
    iget-short v0, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mDataType:S

    const/16 v1, 0xa

    if-eq v0, v1, :cond_2a

    iget-short v0, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mDataType:S

    const/4 v1, 0x5

    if-eq v0, v1, :cond_2a

    .line 828
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot get RATIONAL value from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-short v2, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mDataType:S

    invoke-static {v2}, Lit/sephiroth/android/library/exif2/ExifTag;->convertTypeToString(S)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 830
    :cond_2a
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v0, [Lit/sephiroth/android/library/exif2/Rational;

    check-cast v0, [Lit/sephiroth/android/library/exif2/Rational;

    aget-object v0, v0, p1

    return-object v0
.end method

.method protected getStringByte()[B
    .registers 2

    .prologue
    .line 817
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v0, [B

    check-cast v0, [B

    return-object v0
.end method

.method public getTagId()S
    .registers 2

    .prologue
    .line 152
    iget-short v0, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mTagId:S

    return v0
.end method

.method public getValue()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 730
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    return-object v0
.end method

.method public getValueAsInts()[I
    .registers 7

    .prologue
    const/4 v0, 0x0

    .line 681
    iget-object v3, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    if-nez v3, :cond_6

    .line 692
    :cond_5
    return-object v0

    .line 684
    :cond_6
    iget-object v3, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    instance-of v3, v3, [J

    if-eqz v3, :cond_5

    .line 685
    iget-object v3, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v3, [J

    move-object v2, v3

    check-cast v2, [J

    .line 686
    .local v2, "val":[J
    array-length v3, v2

    new-array v0, v3, [I

    .line 687
    .local v0, "arr":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_17
    array-length v3, v2

    if-ge v1, v3, :cond_5

    .line 688
    aget-wide v4, v2, v1

    long-to-int v3, v4

    aput v3, v0, v1

    .line 687
    add-int/lit8 v1, v1, 0x1

    goto :goto_17
.end method

.method protected getValueAt(I)J
    .registers 5
    .param p1, "index"    # I

    .prologue
    .line 768
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    instance-of v0, v0, [J

    if-eqz v0, :cond_f

    .line 769
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v0, [J

    check-cast v0, [J

    aget-wide v0, v0, p1

    .line 772
    :goto_e
    return-wide v0

    .line 771
    :cond_f
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    instance-of v0, v0, [B

    if-eqz v0, :cond_1f

    .line 772
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    check-cast v0, [B

    check-cast v0, [B

    aget-byte v0, v0, p1

    int-to-long v0, v0

    goto :goto_e

    .line 774
    :cond_1f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot get integer value from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-short v2, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mDataType:S

    invoke-static {v2}, Lit/sephiroth/android/library/exif2/ExifTag;->convertTypeToString(S)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected hasDefinedCount()Z
    .registers 2

    .prologue
    .line 877
    iget-boolean v0, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mHasDefinedDefaultComponentCount:Z

    return v0
.end method

.method public hasValue()Z
    .registers 2

    .prologue
    .line 216
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method protected setHasDefinedCount(Z)V
    .registers 2
    .param p1, "d"    # Z

    .prologue
    .line 873
    iput-boolean p1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mHasDefinedDefaultComponentCount:Z

    .line 874
    return-void
.end method

.method protected setIfd(I)V
    .registers 2
    .param p1, "ifdId"    # I

    .prologue
    .line 145
    iput p1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mIfd:I

    .line 146
    return-void
.end method

.method protected setOffset(I)V
    .registers 2
    .param p1, "offset"    # I

    .prologue
    .line 869
    iput p1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mOffset:I

    .line 870
    return-void
.end method

.method public setValue(B)Z
    .registers 4
    .param p1, "value"    # B

    .prologue
    .line 396
    const/4 v0, 0x1

    new-array v0, v0, [B

    const/4 v1, 0x0

    aput-byte p1, v0, v1

    invoke-virtual {p0, v0}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue([B)Z

    move-result v0

    return v0
.end method

.method public setValue(I)Z
    .registers 4
    .param p1, "value"    # I

    .prologue
    .line 266
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    aput p1, v0, v1

    invoke-virtual {p0, v0}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue([I)Z

    move-result v0

    return v0
.end method

.method public setValue(J)Z
    .registers 6
    .param p1, "value"    # J

    .prologue
    .line 301
    const/4 v0, 0x1

    new-array v0, v0, [J

    const/4 v1, 0x0

    aput-wide p1, v0, v1

    invoke-virtual {p0, v0}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue([J)Z

    move-result v0

    return v0
.end method

.method public setValue(Lit/sephiroth/android/library/exif2/Rational;)Z
    .registers 4
    .param p1, "value"    # Lit/sephiroth/android/library/exif2/Rational;

    .prologue
    .line 351
    const/4 v0, 0x1

    new-array v0, v0, [Lit/sephiroth/android/library/exif2/Rational;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-virtual {p0, v0}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue([Lit/sephiroth/android/library/exif2/Rational;)Z

    move-result v0

    return v0
.end method

.method public setValue(Ljava/lang/Object;)Z
    .registers 8
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const v5, 0xffff

    const/4 v4, 0x0

    .line 410
    if-nez p1, :cond_7

    .line 480
    .end local p1    # "obj":Ljava/lang/Object;
    :cond_6
    :goto_6
    return v4

    .line 413
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_7
    instance-of v3, p1, Ljava/lang/Short;

    if-eqz v3, :cond_17

    .line 414
    check-cast p1, Ljava/lang/Short;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Short;->shortValue()S

    move-result v3

    and-int/2addr v3, v5

    invoke-virtual {p0, v3}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue(I)Z

    move-result v4

    goto :goto_6

    .line 416
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_17
    instance-of v3, p1, Ljava/lang/String;

    if-eqz v3, :cond_22

    .line 417
    check-cast p1, Ljava/lang/String;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue(Ljava/lang/String;)Z

    move-result v4

    goto :goto_6

    .line 419
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_22
    instance-of v3, p1, [I

    if-eqz v3, :cond_2f

    .line 420
    check-cast p1, [I

    .end local p1    # "obj":Ljava/lang/Object;
    check-cast p1, [I

    invoke-virtual {p0, p1}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue([I)Z

    move-result v4

    goto :goto_6

    .line 422
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_2f
    instance-of v3, p1, [J

    if-eqz v3, :cond_3c

    .line 423
    check-cast p1, [J

    .end local p1    # "obj":Ljava/lang/Object;
    check-cast p1, [J

    invoke-virtual {p0, p1}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue([J)Z

    move-result v4

    goto :goto_6

    .line 425
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_3c
    instance-of v3, p1, Lit/sephiroth/android/library/exif2/Rational;

    if-eqz v3, :cond_47

    .line 426
    check-cast p1, Lit/sephiroth/android/library/exif2/Rational;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue(Lit/sephiroth/android/library/exif2/Rational;)Z

    move-result v4

    goto :goto_6

    .line 428
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_47
    instance-of v3, p1, [Lit/sephiroth/android/library/exif2/Rational;

    if-eqz v3, :cond_54

    .line 429
    check-cast p1, [Lit/sephiroth/android/library/exif2/Rational;

    .end local p1    # "obj":Ljava/lang/Object;
    check-cast p1, [Lit/sephiroth/android/library/exif2/Rational;

    invoke-virtual {p0, p1}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue([Lit/sephiroth/android/library/exif2/Rational;)Z

    move-result v4

    goto :goto_6

    .line 431
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_54
    instance-of v3, p1, [B

    if-eqz v3, :cond_61

    .line 432
    check-cast p1, [B

    .end local p1    # "obj":Ljava/lang/Object;
    check-cast p1, [B

    invoke-virtual {p0, p1}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue([B)Z

    move-result v4

    goto :goto_6

    .line 434
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_61
    instance-of v3, p1, Ljava/lang/Integer;

    if-eqz v3, :cond_70

    .line 435
    check-cast p1, Ljava/lang/Integer;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {p0, v3}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue(I)Z

    move-result v4

    goto :goto_6

    .line 437
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_70
    instance-of v3, p1, Ljava/lang/Long;

    if-eqz v3, :cond_7f

    .line 438
    check-cast p1, Ljava/lang/Long;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-virtual {p0, v4, v5}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue(J)Z

    move-result v4

    goto :goto_6

    .line 440
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_7f
    instance-of v3, p1, Ljava/lang/Byte;

    if-eqz v3, :cond_8f

    .line 441
    check-cast p1, Ljava/lang/Byte;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Byte;->byteValue()B

    move-result v3

    invoke-virtual {p0, v3}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue(B)Z

    move-result v4

    goto/16 :goto_6

    .line 443
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_8f
    instance-of v3, p1, [Ljava/lang/Short;

    if-eqz v3, :cond_b7

    .line 445
    check-cast p1, [Ljava/lang/Short;

    .end local p1    # "obj":Ljava/lang/Object;
    move-object v0, p1

    check-cast v0, [Ljava/lang/Short;

    .line 446
    .local v0, "arr":[Ljava/lang/Short;
    array-length v3, v0

    new-array v1, v3, [I

    .line 447
    .local v1, "fin":[I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_9c
    array-length v3, v0

    if-ge v2, v3, :cond_b1

    .line 448
    aget-object v3, v0, v2

    if-nez v3, :cond_a9

    move v3, v4

    :goto_a4
    aput v3, v1, v2

    .line 447
    add-int/lit8 v2, v2, 0x1

    goto :goto_9c

    .line 448
    :cond_a9
    aget-object v3, v0, v2

    invoke-virtual {v3}, Ljava/lang/Short;->shortValue()S

    move-result v3

    and-int/2addr v3, v5

    goto :goto_a4

    .line 450
    :cond_b1
    invoke-virtual {p0, v1}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue([I)Z

    move-result v4

    goto/16 :goto_6

    .line 452
    .end local v0    # "arr":[Ljava/lang/Short;
    .end local v1    # "fin":[I
    .end local v2    # "i":I
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_b7
    instance-of v3, p1, [Ljava/lang/Integer;

    if-eqz v3, :cond_de

    .line 454
    check-cast p1, [Ljava/lang/Integer;

    .end local p1    # "obj":Ljava/lang/Object;
    move-object v0, p1

    check-cast v0, [Ljava/lang/Integer;

    .line 455
    .local v0, "arr":[Ljava/lang/Integer;
    array-length v3, v0

    new-array v1, v3, [I

    .line 456
    .restart local v1    # "fin":[I
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_c4
    array-length v3, v0

    if-ge v2, v3, :cond_d8

    .line 457
    aget-object v3, v0, v2

    if-nez v3, :cond_d1

    move v3, v4

    :goto_cc
    aput v3, v1, v2

    .line 456
    add-int/lit8 v2, v2, 0x1

    goto :goto_c4

    .line 457
    :cond_d1
    aget-object v3, v0, v2

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    goto :goto_cc

    .line 459
    :cond_d8
    invoke-virtual {p0, v1}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue([I)Z

    move-result v4

    goto/16 :goto_6

    .line 461
    .end local v0    # "arr":[Ljava/lang/Integer;
    .end local v1    # "fin":[I
    .end local v2    # "i":I
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_de
    instance-of v3, p1, [Ljava/lang/Long;

    if-eqz v3, :cond_106

    .line 463
    check-cast p1, [Ljava/lang/Long;

    .end local p1    # "obj":Ljava/lang/Object;
    move-object v0, p1

    check-cast v0, [Ljava/lang/Long;

    .line 464
    .local v0, "arr":[Ljava/lang/Long;
    array-length v3, v0

    new-array v1, v3, [J

    .line 465
    .local v1, "fin":[J
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_eb
    array-length v3, v0

    if-ge v2, v3, :cond_100

    .line 466
    aget-object v3, v0, v2

    if-nez v3, :cond_f9

    const-wide/16 v4, 0x0

    :goto_f4
    aput-wide v4, v1, v2

    .line 465
    add-int/lit8 v2, v2, 0x1

    goto :goto_eb

    .line 466
    :cond_f9
    aget-object v3, v0, v2

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    goto :goto_f4

    .line 468
    :cond_100
    invoke-virtual {p0, v1}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue([J)Z

    move-result v4

    goto/16 :goto_6

    .line 470
    .end local v0    # "arr":[Ljava/lang/Long;
    .end local v1    # "fin":[J
    .end local v2    # "i":I
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_106
    instance-of v3, p1, [Ljava/lang/Byte;

    if-eqz v3, :cond_6

    .line 472
    check-cast p1, [Ljava/lang/Byte;

    .end local p1    # "obj":Ljava/lang/Object;
    move-object v0, p1

    check-cast v0, [Ljava/lang/Byte;

    .line 473
    .local v0, "arr":[Ljava/lang/Byte;
    array-length v3, v0

    new-array v1, v3, [B

    .line 474
    .local v1, "fin":[B
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_113
    array-length v3, v0

    if-ge v2, v3, :cond_127

    .line 475
    aget-object v3, v0, v2

    if-nez v3, :cond_120

    move v3, v4

    :goto_11b
    aput-byte v3, v1, v2

    .line 474
    add-int/lit8 v2, v2, 0x1

    goto :goto_113

    .line 475
    :cond_120
    aget-object v3, v0, v2

    invoke-virtual {v3}, Ljava/lang/Byte;->byteValue()B

    move-result v3

    goto :goto_11b

    .line 477
    :cond_127
    invoke-virtual {p0, v1}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue([B)Z

    move-result v4

    goto/16 :goto_6
.end method

.method public setValue(Ljava/lang/String;)Z
    .registers 10
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x7

    const/4 v6, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 515
    iget-short v5, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mDataType:S

    if-eq v5, v6, :cond_d

    iget-short v5, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mDataType:S

    if-eq v5, v7, :cond_d

    .line 533
    :cond_c
    :goto_c
    return v3

    .line 519
    :cond_d
    sget-object v5, Lit/sephiroth/android/library/exif2/ExifTag;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v5}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    .line 520
    .local v0, "buf":[B
    move-object v2, v0

    .line 521
    .local v2, "finalBuf":[B
    array-length v5, v0

    if-lez v5, :cond_38

    .line 522
    array-length v5, v0

    add-int/lit8 v5, v5, -0x1

    aget-byte v5, v0, v5

    if-eqz v5, :cond_22

    iget-short v5, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mDataType:S

    if-ne v5, v7, :cond_30

    :cond_22
    move-object v2, v0

    .line 527
    :cond_23
    :goto_23
    array-length v1, v2

    .line 528
    .local v1, "count":I
    invoke-direct {p0, v1}, Lit/sephiroth/android/library/exif2/ExifTag;->checkBadComponentCount(I)Z

    move-result v5

    if-nez v5, :cond_c

    .line 531
    iput v1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mComponentCountActual:I

    .line 532
    iput-object v2, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    move v3, v4

    .line 533
    goto :goto_c

    .line 522
    .end local v1    # "count":I
    :cond_30
    array-length v5, v0

    add-int/lit8 v5, v5, 0x1

    invoke-static {v0, v5}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v2

    goto :goto_23

    .line 524
    :cond_38
    iget-short v5, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mDataType:S

    if-ne v5, v6, :cond_23

    iget v5, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mComponentCountActual:I

    if-ne v5, v4, :cond_23

    .line 525
    new-array v2, v4, [B

    .end local v2    # "finalBuf":[B
    aput-byte v3, v2, v3

    .restart local v2    # "finalBuf":[B
    goto :goto_23
.end method

.method public setValue([B)Z
    .registers 4
    .param p1, "value"    # [B

    .prologue
    .line 382
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue([BII)Z

    move-result v0

    return v0
.end method

.method public setValue([BII)Z
    .registers 8
    .param p1, "value"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 366
    invoke-direct {p0, p3}, Lit/sephiroth/android/library/exif2/ExifTag;->checkBadComponentCount(I)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 375
    :cond_8
    :goto_8
    return v0

    .line 369
    :cond_9
    iget-short v2, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mDataType:S

    if-eq v2, v1, :cond_12

    iget-short v2, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mDataType:S

    const/4 v3, 0x7

    if-ne v2, v3, :cond_8

    .line 372
    :cond_12
    new-array v2, p3, [B

    iput-object v2, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    .line 373
    iget-object v2, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    invoke-static {p1, p2, v2, v0, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 374
    iput p3, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mComponentCountActual:I

    move v0, v1

    .line 375
    goto :goto_8
.end method

.method public setValue([I)Z
    .registers 9
    .param p1, "value"    # [I

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v2, 0x0

    .line 231
    array-length v3, p1

    invoke-direct {p0, v3}, Lit/sephiroth/android/library/exif2/ExifTag;->checkBadComponentCount(I)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 251
    :cond_a
    :goto_a
    return v2

    .line 234
    :cond_b
    iget-short v3, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mDataType:S

    if-eq v3, v5, :cond_19

    iget-short v3, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mDataType:S

    const/16 v4, 0x9

    if-eq v3, v4, :cond_19

    iget-short v3, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mDataType:S

    if-ne v3, v6, :cond_a

    .line 238
    :cond_19
    iget-short v3, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mDataType:S

    if-ne v3, v5, :cond_23

    invoke-direct {p0, p1}, Lit/sephiroth/android/library/exif2/ExifTag;->checkOverflowForUnsignedShort([I)Z

    move-result v3

    if-nez v3, :cond_a

    .line 241
    :cond_23
    iget-short v3, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mDataType:S

    if-ne v3, v6, :cond_2d

    invoke-direct {p0, p1}, Lit/sephiroth/android/library/exif2/ExifTag;->checkOverflowForUnsignedLong([I)Z

    move-result v3

    if-nez v3, :cond_a

    .line 245
    :cond_2d
    array-length v2, p1

    new-array v0, v2, [J

    .line 246
    .local v0, "data":[J
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_31
    array-length v2, p1

    if-ge v1, v2, :cond_3c

    .line 247
    aget v2, p1, v1

    int-to-long v2, v2

    aput-wide v2, v0, v1

    .line 246
    add-int/lit8 v1, v1, 0x1

    goto :goto_31

    .line 249
    :cond_3c
    iput-object v0, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    .line 250
    array-length v2, p1

    iput v2, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mComponentCountActual:I

    .line 251
    const/4 v2, 0x1

    goto :goto_a
.end method

.method public setValue([J)Z
    .registers 5
    .param p1, "value"    # [J

    .prologue
    const/4 v0, 0x0

    .line 280
    array-length v1, p1

    invoke-direct {p0, v1}, Lit/sephiroth/android/library/exif2/ExifTag;->checkBadComponentCount(I)Z

    move-result v1

    if-nez v1, :cond_d

    iget-short v1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mDataType:S

    const/4 v2, 0x4

    if-eq v1, v2, :cond_e

    .line 288
    :cond_d
    :goto_d
    return v0

    .line 283
    :cond_e
    invoke-direct {p0, p1}, Lit/sephiroth/android/library/exif2/ExifTag;->checkOverflowForUnsignedLong([J)Z

    move-result v1

    if-nez v1, :cond_d

    .line 286
    iput-object p1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    .line 287
    array-length v0, p1

    iput v0, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mComponentCountActual:I

    .line 288
    const/4 v0, 0x1

    goto :goto_d
.end method

.method public setValue([Lit/sephiroth/android/library/exif2/Rational;)Z
    .registers 6
    .param p1, "value"    # [Lit/sephiroth/android/library/exif2/Rational;

    .prologue
    const/16 v3, 0xa

    const/4 v2, 0x5

    const/4 v0, 0x0

    .line 319
    array-length v1, p1

    invoke-direct {p0, v1}, Lit/sephiroth/android/library/exif2/ExifTag;->checkBadComponentCount(I)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 334
    :cond_b
    :goto_b
    return v0

    .line 322
    :cond_c
    iget-short v1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mDataType:S

    if-eq v1, v2, :cond_14

    iget-short v1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mDataType:S

    if-ne v1, v3, :cond_b

    .line 325
    :cond_14
    iget-short v1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mDataType:S

    if-ne v1, v2, :cond_1e

    invoke-direct {p0, p1}, Lit/sephiroth/android/library/exif2/ExifTag;->checkOverflowForUnsignedRational([Lit/sephiroth/android/library/exif2/Rational;)Z

    move-result v1

    if-nez v1, :cond_b

    .line 328
    :cond_1e
    iget-short v1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mDataType:S

    if-ne v1, v3, :cond_28

    invoke-direct {p0, p1}, Lit/sephiroth/android/library/exif2/ExifTag;->checkOverflowForRational([Lit/sephiroth/android/library/exif2/Rational;)Z

    move-result v1

    if-nez v1, :cond_b

    .line 332
    :cond_28
    iput-object p1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mValue:Ljava/lang/Object;

    .line 333
    array-length v0, p1

    iput v0, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mComponentCountActual:I

    .line 334
    const/4 v0, 0x1

    goto :goto_b
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    .prologue
    .line 970
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "tag id: %04X\n"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-short v4, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mTagId:S

    invoke-static {v4}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "ifd id: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mIfd:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\ntype: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-short v1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mDataType:S

    invoke-static {v1}, Lit/sephiroth/android/library/exif2/ExifTag;->convertTypeToString(S)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\ncount: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mComponentCountActual:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\noffset: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lit/sephiroth/android/library/exif2/ExifTag;->mOffset:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nvalue: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lit/sephiroth/android/library/exif2/ExifTag;->forceGetValueAsString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
