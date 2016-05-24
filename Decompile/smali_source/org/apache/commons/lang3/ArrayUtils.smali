.class public Lorg/apache/commons/lang3/ArrayUtils;
.super Ljava/lang/Object;
.source "ArrayUtils.java"


# static fields
.field public static final EMPTY_BOOLEAN_ARRAY:[Z

.field public static final EMPTY_BOOLEAN_OBJECT_ARRAY:[Ljava/lang/Boolean;

.field public static final EMPTY_BYTE_ARRAY:[B

.field public static final EMPTY_BYTE_OBJECT_ARRAY:[Ljava/lang/Byte;

.field public static final EMPTY_CHARACTER_OBJECT_ARRAY:[Ljava/lang/Character;

.field public static final EMPTY_CHAR_ARRAY:[C

.field public static final EMPTY_CLASS_ARRAY:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field public static final EMPTY_DOUBLE_ARRAY:[D

.field public static final EMPTY_DOUBLE_OBJECT_ARRAY:[Ljava/lang/Double;

.field public static final EMPTY_FLOAT_ARRAY:[F

.field public static final EMPTY_FLOAT_OBJECT_ARRAY:[Ljava/lang/Float;

.field public static final EMPTY_INTEGER_OBJECT_ARRAY:[Ljava/lang/Integer;

.field public static final EMPTY_INT_ARRAY:[I

.field public static final EMPTY_LONG_ARRAY:[J

.field public static final EMPTY_LONG_OBJECT_ARRAY:[Ljava/lang/Long;

.field public static final EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

.field public static final EMPTY_SHORT_ARRAY:[S

.field public static final EMPTY_SHORT_OBJECT_ARRAY:[Ljava/lang/Short;

.field public static final EMPTY_STRING_ARRAY:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/4 v1, 0x0

    .line 51
    new-array v0, v1, [Ljava/lang/Object;

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

    .line 55
    new-array v0, v1, [Ljava/lang/Class;

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_CLASS_ARRAY:[Ljava/lang/Class;

    .line 59
    new-array v0, v1, [Ljava/lang/String;

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    .line 63
    new-array v0, v1, [J

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_LONG_ARRAY:[J

    .line 67
    new-array v0, v1, [Ljava/lang/Long;

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_LONG_OBJECT_ARRAY:[Ljava/lang/Long;

    .line 71
    new-array v0, v1, [I

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_INT_ARRAY:[I

    .line 75
    new-array v0, v1, [Ljava/lang/Integer;

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_INTEGER_OBJECT_ARRAY:[Ljava/lang/Integer;

    .line 79
    new-array v0, v1, [S

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_SHORT_ARRAY:[S

    .line 83
    new-array v0, v1, [Ljava/lang/Short;

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_SHORT_OBJECT_ARRAY:[Ljava/lang/Short;

    .line 87
    new-array v0, v1, [B

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_BYTE_ARRAY:[B

    .line 91
    new-array v0, v1, [Ljava/lang/Byte;

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_BYTE_OBJECT_ARRAY:[Ljava/lang/Byte;

    .line 95
    new-array v0, v1, [D

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_DOUBLE_ARRAY:[D

    .line 99
    new-array v0, v1, [Ljava/lang/Double;

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_DOUBLE_OBJECT_ARRAY:[Ljava/lang/Double;

    .line 103
    new-array v0, v1, [F

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_FLOAT_ARRAY:[F

    .line 107
    new-array v0, v1, [Ljava/lang/Float;

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_FLOAT_OBJECT_ARRAY:[Ljava/lang/Float;

    .line 111
    new-array v0, v1, [Z

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_BOOLEAN_ARRAY:[Z

    .line 115
    new-array v0, v1, [Ljava/lang/Boolean;

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_BOOLEAN_OBJECT_ARRAY:[Ljava/lang/Boolean;

    .line 119
    new-array v0, v1, [C

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_CHAR_ARRAY:[C

    .line 123
    new-array v0, v1, [Ljava/lang/Character;

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_CHARACTER_OBJECT_ARRAY:[Ljava/lang/Character;

    return-void
.end method

.method private static add(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 10
    .param p0, "array"    # Ljava/lang/Object;
    .param p1, "index"    # I
    .param p2, "element"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "I",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .local p3, "clss":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v4, 0x0

    .line 4562
    if-nez p0, :cond_2d

    .line 4563
    if-eqz p1, :cond_24

    .line 4564
    new-instance v3, Ljava/lang/IndexOutOfBoundsException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Index: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", Length: 0"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 4566
    :cond_24
    const/4 v3, 0x1

    invoke-static {p3, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v0

    .line 4567
    .local v0, "joinedArray":Ljava/lang/Object;
    invoke-static {v0, v4, p2}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 4580
    .end local v0    # "joinedArray":Ljava/lang/Object;
    :goto_2c
    return-object v0

    .line 4570
    :cond_2d
    invoke-static {p0}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v1

    .line 4571
    .local v1, "length":I
    if-gt p1, v1, :cond_35

    if-gez p1, :cond_58

    .line 4572
    :cond_35
    new-instance v3, Ljava/lang/IndexOutOfBoundsException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Index: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", Length: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 4574
    :cond_58
    add-int/lit8 v3, v1, 0x1

    invoke-static {p3, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v2

    .line 4575
    .local v2, "result":Ljava/lang/Object;
    invoke-static {p0, v4, v2, v4, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 4576
    invoke-static {v2, p1, p2}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 4577
    if-ge p1, v1, :cond_6d

    .line 4578
    add-int/lit8 v3, p1, 0x1

    sub-int v4, v1, p1

    invoke-static {p0, p1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_6d
    move-object v0, v2

    .line 4580
    goto :goto_2c
.end method

.method public static add([II)[I
    .registers 4
    .param p0, "array"    # [I
    .param p1, "element"    # I

    .prologue
    .line 4181
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {p0, v1}, Lorg/apache/commons/lang3/ArrayUtils;->copyArrayGrow1(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    move-object v0, v1

    check-cast v0, [I

    .line 4182
    .local v0, "newArray":[I
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aput p1, v0, v1

    .line 4183
    return-object v0
.end method

.method public static add([III)[I
    .registers 5
    .param p0, "array"    # [I
    .param p1, "index"    # I
    .param p2, "element"    # I

    .prologue
    .line 4454
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang3/ArrayUtils;->add(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    check-cast v0, [I

    return-object v0
.end method

.method public static varargs addAll([I[I)[I
    .registers 6
    .param p0, "array1"    # [I
    .param p1, "array2"    # [I

    .prologue
    const/4 v3, 0x0

    .line 3881
    if-nez p0, :cond_8

    .line 3882
    invoke-static {p1}, Lorg/apache/commons/lang3/ArrayUtils;->clone([I)[I

    move-result-object v0

    .line 3889
    :goto_7
    return-object v0

    .line 3883
    :cond_8
    if-nez p1, :cond_f

    .line 3884
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->clone([I)[I

    move-result-object v0

    goto :goto_7

    .line 3886
    :cond_f
    array-length v1, p0

    array-length v2, p1

    add-int/2addr v1, v2

    new-array v0, v1, [I

    .line 3887
    .local v0, "joinedArray":[I
    array-length v1, p0

    invoke-static {p0, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 3888
    array-length v1, p0

    array-length v2, p1

    invoke-static {p1, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_7
.end method

.method public static clone([I)[I
    .registers 2
    .param p0, "array"    # [I

    .prologue
    .line 357
    if-nez p0, :cond_4

    .line 358
    const/4 v0, 0x0

    .line 360
    :goto_3
    return-object v0

    :cond_4
    invoke-virtual {p0}, [I->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    goto :goto_3
.end method

.method private static copyArrayGrow1(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 7
    .param p0, "array"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .local p1, "newArrayComponentType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v4, 0x0

    .line 4250
    if-eqz p0, :cond_19

    .line 4251
    invoke-static {p0}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v0

    .line 4252
    .local v0, "arrayLength":I
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v2

    add-int/lit8 v3, v0, 0x1

    invoke-static {v2, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    .line 4253
    .local v1, "newArray":Ljava/lang/Object;
    invoke-static {p0, v4, v1, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 4256
    .end local v0    # "arrayLength":I
    .end local v1    # "newArray":Ljava/lang/Object;
    :goto_18
    return-object v1

    :cond_19
    const/4 v2, 0x1

    invoke-static {p1, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    goto :goto_18
.end method
