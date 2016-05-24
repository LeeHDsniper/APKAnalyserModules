.class public abstract Lcom/google/android/gms/internal/zzod;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/google/android/gms/internal/zzod;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static zzA(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/google/android/gms/internal/zzod;->zza(Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static zzF(Ljava/util/Map;)Ljava/lang/String;
    .registers 2

    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/google/android/gms/internal/zzod;->zza(Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static zza(Ljava/lang/Object;I)Ljava/lang/String;
    .registers 9

    const/4 v0, 0x0

    const/16 v1, 0xa

    if-le p1, v1, :cond_8

    const-string v0, "ERROR: Recursive toString calls"

    :goto_7
    return-object v0

    :cond_8
    if-nez p0, :cond_d

    const-string v0, ""

    goto :goto_7

    :cond_d
    instance-of v1, p0, Ljava/lang/String;

    if-eqz v1, :cond_22

    move-object v0, p0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1d

    const-string v0, ""

    goto :goto_7

    :cond_1d
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    :cond_22
    instance-of v1, p0, Ljava/lang/Integer;

    if-eqz v1, :cond_37

    move-object v0, p0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_32

    const-string v0, ""

    goto :goto_7

    :cond_32
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    :cond_37
    instance-of v1, p0, Ljava/lang/Long;

    if-eqz v1, :cond_50

    move-object v0, p0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_4b

    const-string v0, ""

    goto :goto_7

    :cond_4b
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    :cond_50
    instance-of v1, p0, Ljava/lang/Double;

    if-eqz v1, :cond_69

    move-object v0, p0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmpl-double v0, v0, v2

    if-nez v0, :cond_64

    const-string v0, ""

    goto :goto_7

    :cond_64
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    :cond_69
    instance-of v1, p0, Ljava/lang/Boolean;

    if-eqz v1, :cond_7e

    move-object v0, p0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_79

    const-string v0, ""

    goto :goto_7

    :cond_79
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    :cond_7e
    instance-of v1, p0, Ljava/util/List;

    if-eqz v1, :cond_c4

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    if-lez p1, :cond_8e

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :cond_8e
    check-cast p0, Ljava/util/List;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v1

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_98
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_b7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v4

    if-le v4, v1, :cond_ad

    const-string v4, ", "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :cond_ad
    add-int/lit8 v4, p1, 0x1

    invoke-static {v3, v4}, Lcom/google/android/gms/internal/zzod;->zza(Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_98

    :cond_b7
    if-lez p1, :cond_be

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :cond_be
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    :cond_c4
    instance-of v1, p0, Ljava/util/Map;

    if-eqz v1, :cond_132

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    new-instance v1, Ljava/util/TreeMap;

    check-cast p0, Ljava/util/Map;

    invoke-direct {v1, p0}, Ljava/util/TreeMap;-><init>(Ljava/util/Map;)V

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    move v1, v0

    move v2, v0

    :cond_de
    :goto_de
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_125

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v6, p1, 0x1

    invoke-static {v5, v6}, Lcom/google/android/gms/internal/zzod;->zza(Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_de

    if-lez p1, :cond_108

    if-nez v2, :cond_108

    const-string v1, "{"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const/4 v2, 0x1

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->length()I

    move-result v1

    :cond_108
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->length()I

    move-result v6

    if-le v6, v1, :cond_113

    const-string v6, ", "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :cond_113
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const/16 v0, 0x3d

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_de

    :cond_125
    if-eqz v2, :cond_12c

    const-string v0, "}"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :cond_12c
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    :cond_132
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7
.end method


# virtual methods
.method public abstract zza(Lcom/google/android/gms/internal/zzod;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method
