.class public final Lcom/adobe/creativesdk/aviary/internal/utils/ArrayUtils;
.super Ljava/lang/Object;
.source "ArrayUtils.java"


# static fields
.field public static final EMPTY_FLOAT_ARRAY:[F


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 6
    const/4 v0, 0x0

    new-array v0, v0, [F

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/ArrayUtils;->EMPTY_FLOAT_ARRAY:[F

    return-void
.end method

.method public static toPrimitive(Ljava/util/List;)[F
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Float;",
            ">;)[F"
        }
    .end annotation

    .prologue
    .line 46
    .local p0, "array":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    if-nez p0, :cond_4

    .line 47
    const/4 v1, 0x0

    .line 55
    :cond_3
    :goto_3
    return-object v1

    .line 48
    :cond_4
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_d

    .line 49
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/utils/ArrayUtils;->EMPTY_FLOAT_ARRAY:[F

    goto :goto_3

    .line 51
    :cond_d
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    new-array v1, v2, [F

    .line 52
    .local v1, "result":[F
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_14
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_3

    .line 53
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    aput v2, v1, v0

    .line 52
    add-int/lit8 v0, v0, 0x1

    goto :goto_14
.end method
