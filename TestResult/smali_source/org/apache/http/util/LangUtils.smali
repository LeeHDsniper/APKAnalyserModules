.class public final Lorg/apache/http/util/LangUtils;
.super Ljava/lang/Object;
.source "LangUtils.java"


# static fields
.field public static final HASH_OFFSET:I = 0x25

.field public static final HASH_SEED:I = 0x11


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    return-void
.end method

.method public static equals(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 3
    .param p0, "obj1"    # Ljava/lang/Object;
    .param p1, "obj2"    # Ljava/lang/Object;

    .prologue
    .line 66
    if-nez p0, :cond_8

    if-nez p1, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5

    :cond_8
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_5
.end method

.method public static equals([Ljava/lang/Object;[Ljava/lang/Object;)Z
    .registers 7
    .param p0, "a1"    # [Ljava/lang/Object;
    .param p1, "a2"    # [Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 85
    if-nez p0, :cond_9

    .line 86
    if-nez p1, :cond_7

    .line 96
    :cond_6
    :goto_6
    return v1

    :cond_7
    move v1, v2

    .line 86
    goto :goto_6

    .line 88
    :cond_9
    if-eqz p1, :cond_22

    array-length v3, p0

    array-length v4, p1

    if-ne v3, v4, :cond_22

    .line 89
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_10
    array-length v3, p0

    if-ge v0, v3, :cond_6

    .line 90
    aget-object v3, p0, v0

    aget-object v4, p1, v0

    invoke-static {v3, v4}, Lorg/apache/http/util/LangUtils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1f

    move v1, v2

    .line 91
    goto :goto_6

    .line 89
    :cond_1f
    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    .end local v0    # "i":I
    :cond_22
    move v1, v2

    .line 96
    goto :goto_6
.end method

.method public static hashCode(II)I
    .registers 3
    .param p0, "seed"    # I
    .param p1, "hashcode"    # I

    .prologue
    .line 47
    mul-int/lit8 v0, p0, 0x25

    add-int/2addr v0, p1

    return v0
.end method

.method public static hashCode(ILjava/lang/Object;)I
    .registers 3
    .param p0, "seed"    # I
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 55
    if-eqz p1, :cond_b

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_6
    invoke-static {p0, v0}, Lorg/apache/http/util/LangUtils;->hashCode(II)I

    move-result v0

    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public static hashCode(IZ)I
    .registers 3
    .param p0, "seed"    # I
    .param p1, "b"    # Z

    .prologue
    .line 51
    if-eqz p1, :cond_8

    const/4 v0, 0x1

    :goto_3
    invoke-static {p0, v0}, Lorg/apache/http/util/LangUtils;->hashCode(II)I

    move-result v0

    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_3
.end method
