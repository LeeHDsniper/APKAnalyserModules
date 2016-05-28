.class public final Lorg/apache/http/util/TextUtils;
.super Ljava/lang/Object;
.source "TextUtils.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isBlank(Ljava/lang/CharSequence;)Z
    .registers 4
    .param p0, "s"    # Ljava/lang/CharSequence;

    .prologue
    const/4 v1, 0x1

    .line 43
    if-nez p0, :cond_4

    .line 51
    :cond_3
    :goto_3
    return v1

    .line 46
    :cond_4
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-ge v0, v2, :cond_3

    .line 47
    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v2

    if-nez v2, :cond_17

    .line 48
    const/4 v1, 0x0

    goto :goto_3

    .line 46
    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_5
.end method

.method public static isEmpty(Ljava/lang/CharSequence;)Z
    .registers 3
    .param p0, "s"    # Ljava/lang/CharSequence;

    .prologue
    const/4 v0, 0x1

    .line 36
    if-nez p0, :cond_4

    .line 39
    :cond_3
    :goto_3
    return v0

    :cond_4
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-eqz v1, :cond_3

    const/4 v0, 0x0

    goto :goto_3
.end method
