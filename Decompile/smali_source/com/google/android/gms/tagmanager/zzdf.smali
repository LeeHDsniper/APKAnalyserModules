.class public Lcom/google/android/gms/tagmanager/zzdf;
.super Ljava/lang/Object;


# static fields
.field private static final zzaSN:Ljava/lang/Object;

.field private static zzaSO:Ljava/lang/Long;

.field private static zzaSP:Ljava/lang/Double;

.field private static zzaSQ:Lcom/google/android/gms/tagmanager/zzde;

.field private static zzaSR:Ljava/lang/String;

.field private static zzaSS:Ljava/lang/Boolean;

.field private static zzaST:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static zzaSU:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static zzaSV:Lcom/google/android/gms/internal/zzag$zza;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    const-wide/16 v6, 0x0

    const/4 v4, 0x0

    const/4 v0, 0x0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSN:Ljava/lang/Object;

    new-instance v0, Ljava/lang/Long;

    invoke-direct {v0, v6, v7}, Ljava/lang/Long;-><init>(J)V

    sput-object v0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSO:Ljava/lang/Long;

    new-instance v0, Ljava/lang/Double;

    const-wide/16 v2, 0x0

    invoke-direct {v0, v2, v3}, Ljava/lang/Double;-><init>(D)V

    sput-object v0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSP:Ljava/lang/Double;

    invoke-static {v6, v7}, Lcom/google/android/gms/tagmanager/zzde;->zzT(J)Lcom/google/android/gms/tagmanager/zzde;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSQ:Lcom/google/android/gms/tagmanager/zzde;

    new-instance v0, Ljava/lang/String;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSR:Ljava/lang/String;

    new-instance v0, Ljava/lang/Boolean;

    invoke-direct {v0, v4}, Ljava/lang/Boolean;-><init>(Z)V

    sput-object v0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSS:Ljava/lang/Boolean;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v4}, Ljava/util/ArrayList;-><init>(I)V

    sput-object v0, Lcom/google/android/gms/tagmanager/zzdf;->zzaST:Ljava/util/List;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSU:Ljava/util/Map;

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSR:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdf;->zzK(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzag$zza;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSV:Lcom/google/android/gms/internal/zzag$zza;

    return-void
.end method

.method private static getDouble(Ljava/lang/Object;)D
    .registers 3
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    instance-of v0, p0, Ljava/lang/Number;

    if-eqz v0, :cond_b

    check-cast p0, Ljava/lang/Number;

    .end local p0    # "o":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    .restart local p0    # "o":Ljava/lang/Object;
    :goto_a
    return-wide v0

    :cond_b
    const-string v0, "getDouble received non-Number"

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    const-wide/16 v0, 0x0

    goto :goto_a
.end method

.method public static zzBa()Ljava/lang/Object;
    .registers 1

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSN:Ljava/lang/Object;

    return-object v0
.end method

.method public static zzBb()Ljava/lang/Long;
    .registers 1

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSO:Ljava/lang/Long;

    return-object v0
.end method

.method public static zzBd()Ljava/lang/Boolean;
    .registers 1

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSS:Ljava/lang/Boolean;

    return-object v0
.end method

.method public static zzBe()Lcom/google/android/gms/tagmanager/zzde;
    .registers 1

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSQ:Lcom/google/android/gms/tagmanager/zzde;

    return-object v0
.end method

.method public static zzBf()Ljava/lang/String;
    .registers 1

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSR:Ljava/lang/String;

    return-object v0
.end method

.method public static zzBg()Lcom/google/android/gms/internal/zzag$zza;
    .registers 1

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSV:Lcom/google/android/gms/internal/zzag$zza;

    return-object v0
.end method

.method public static zzF(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2

    if-nez p0, :cond_5

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSR:Ljava/lang/String;

    :goto_4
    return-object v0

    :cond_5
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_4
.end method

.method public static zzG(Ljava/lang/Object;)Lcom/google/android/gms/tagmanager/zzde;
    .registers 3

    instance-of v0, p0, Lcom/google/android/gms/tagmanager/zzde;

    if-eqz v0, :cond_7

    check-cast p0, Lcom/google/android/gms/tagmanager/zzde;

    :goto_6
    return-object p0

    :cond_7
    invoke-static {p0}, Lcom/google/android/gms/tagmanager/zzdf;->zzM(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/zzdf;->zzN(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/google/android/gms/tagmanager/zzde;->zzT(J)Lcom/google/android/gms/tagmanager/zzde;

    move-result-object p0

    goto :goto_6

    :cond_16
    invoke-static {p0}, Lcom/google/android/gms/tagmanager/zzdf;->zzL(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_29

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/zzdf;->getDouble(Ljava/lang/Object;)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzde;->zza(Ljava/lang/Double;)Lcom/google/android/gms/tagmanager/zzde;

    move-result-object p0

    goto :goto_6

    :cond_29
    invoke-static {p0}, Lcom/google/android/gms/tagmanager/zzdf;->zzF(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdf;->zzeZ(Ljava/lang/String;)Lcom/google/android/gms/tagmanager/zzde;

    move-result-object p0

    goto :goto_6
.end method

.method public static zzH(Ljava/lang/Object;)Ljava/lang/Long;
    .registers 3

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/zzdf;->zzM(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/zzdf;->zzN(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    :goto_e
    return-object v0

    :cond_f
    invoke-static {p0}, Lcom/google/android/gms/tagmanager/zzdf;->zzF(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdf;->zzfa(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    goto :goto_e
.end method

.method public static zzJ(Ljava/lang/Object;)Ljava/lang/Boolean;
    .registers 2

    instance-of v0, p0, Ljava/lang/Boolean;

    if-eqz v0, :cond_7

    check-cast p0, Ljava/lang/Boolean;

    :goto_6
    return-object p0

    :cond_7
    invoke-static {p0}, Lcom/google/android/gms/tagmanager/zzdf;->zzF(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdf;->zzfc(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    goto :goto_6
.end method

.method public static zzK(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzag$zza;
    .registers 11

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v4, Lcom/google/android/gms/internal/zzag$zza;

    invoke-direct {v4}, Lcom/google/android/gms/internal/zzag$zza;-><init>()V

    instance-of v0, p0, Lcom/google/android/gms/internal/zzag$zza;

    if-eqz v0, :cond_e

    check-cast p0, Lcom/google/android/gms/internal/zzag$zza;

    :goto_d
    return-object p0

    :cond_e
    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_1c

    iput v3, v4, Lcom/google/android/gms/internal/zzag$zza;->type:I

    check-cast p0, Ljava/lang/String;

    iput-object p0, v4, Lcom/google/android/gms/internal/zzag$zza;->zziU:Ljava/lang/String;

    :goto_18
    iput-boolean v2, v4, Lcom/google/android/gms/internal/zzag$zza;->zzje:Z

    move-object p0, v4

    goto :goto_d

    :cond_1c
    instance-of v0, p0, Ljava/util/List;

    if-eqz v0, :cond_62

    const/4 v0, 0x2

    iput v0, v4, Lcom/google/android/gms/internal/zzag$zza;->type:I

    check-cast p0, Ljava/util/List;

    new-instance v5, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    invoke-direct {v5, v0}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    move v1, v2

    :goto_33
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_56

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdf;->zzK(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzag$zza;

    move-result-object v7

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSV:Lcom/google/android/gms/internal/zzag$zza;

    if-ne v7, v0, :cond_48

    sget-object p0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSV:Lcom/google/android/gms/internal/zzag$zza;

    goto :goto_d

    :cond_48
    if-nez v1, :cond_4e

    iget-boolean v0, v7, Lcom/google/android/gms/internal/zzag$zza;->zzje:Z

    if-eqz v0, :cond_54

    :cond_4e
    move v0, v3

    :goto_4f
    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move v1, v0

    goto :goto_33

    :cond_54
    move v0, v2

    goto :goto_4f

    :cond_56
    new-array v0, v2, [Lcom/google/android/gms/internal/zzag$zza;

    invoke-interface {v5, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/gms/internal/zzag$zza;

    iput-object v0, v4, Lcom/google/android/gms/internal/zzag$zza;->zziV:[Lcom/google/android/gms/internal/zzag$zza;

    move v2, v1

    goto :goto_18

    :cond_62
    instance-of v0, p0, Ljava/util/Map;

    if-eqz v0, :cond_da

    const/4 v0, 0x3

    iput v0, v4, Lcom/google/android/gms/internal/zzag$zza;->type:I

    check-cast p0, Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    new-instance v5, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v1

    invoke-direct {v5, v1}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v6, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v1

    invoke-direct {v6, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    move v1, v2

    :goto_86
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_c3

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    invoke-static {v8}, Lcom/google/android/gms/tagmanager/zzdf;->zzK(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzag$zza;

    move-result-object v8

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdf;->zzK(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzag$zza;

    move-result-object v9

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSV:Lcom/google/android/gms/internal/zzag$zza;

    if-eq v8, v0, :cond_aa

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSV:Lcom/google/android/gms/internal/zzag$zza;

    if-ne v9, v0, :cond_ae

    :cond_aa
    sget-object p0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSV:Lcom/google/android/gms/internal/zzag$zza;

    goto/16 :goto_d

    :cond_ae
    if-nez v1, :cond_b8

    iget-boolean v0, v8, Lcom/google/android/gms/internal/zzag$zza;->zzje:Z

    if-nez v0, :cond_b8

    iget-boolean v0, v9, Lcom/google/android/gms/internal/zzag$zza;->zzje:Z

    if-eqz v0, :cond_c1

    :cond_b8
    move v0, v3

    :goto_b9
    invoke-interface {v5, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v6, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move v1, v0

    goto :goto_86

    :cond_c1
    move v0, v2

    goto :goto_b9

    :cond_c3
    new-array v0, v2, [Lcom/google/android/gms/internal/zzag$zza;

    invoke-interface {v5, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/gms/internal/zzag$zza;

    iput-object v0, v4, Lcom/google/android/gms/internal/zzag$zza;->zziW:[Lcom/google/android/gms/internal/zzag$zza;

    new-array v0, v2, [Lcom/google/android/gms/internal/zzag$zza;

    invoke-interface {v6, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/gms/internal/zzag$zza;

    iput-object v0, v4, Lcom/google/android/gms/internal/zzag$zza;->zziX:[Lcom/google/android/gms/internal/zzag$zza;

    move v2, v1

    goto/16 :goto_18

    :cond_da
    invoke-static {p0}, Lcom/google/android/gms/tagmanager/zzdf;->zzL(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_ea

    iput v3, v4, Lcom/google/android/gms/internal/zzag$zza;->type:I

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v4, Lcom/google/android/gms/internal/zzag$zza;->zziU:Ljava/lang/String;

    goto/16 :goto_18

    :cond_ea
    invoke-static {p0}, Lcom/google/android/gms/tagmanager/zzdf;->zzM(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_fb

    const/4 v0, 0x6

    iput v0, v4, Lcom/google/android/gms/internal/zzag$zza;->type:I

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/zzdf;->zzN(Ljava/lang/Object;)J

    move-result-wide v0

    iput-wide v0, v4, Lcom/google/android/gms/internal/zzag$zza;->zzja:J

    goto/16 :goto_18

    :cond_fb
    instance-of v0, p0, Ljava/lang/Boolean;

    if-eqz v0, :cond_10d

    const/16 v0, 0x8

    iput v0, v4, Lcom/google/android/gms/internal/zzag$zza;->type:I

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, v4, Lcom/google/android/gms/internal/zzag$zza;->zzjb:Z

    goto/16 :goto_18

    :cond_10d
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Converting to Value from unknown object type: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-nez p0, :cond_12b

    const-string v0, "null"

    :goto_11c
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    sget-object p0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSV:Lcom/google/android/gms/internal/zzag$zza;

    goto/16 :goto_d

    :cond_12b
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_11c
.end method

.method private static zzL(Ljava/lang/Object;)Z
    .registers 2

    instance-of v0, p0, Ljava/lang/Double;

    if-nez v0, :cond_14

    instance-of v0, p0, Ljava/lang/Float;

    if-nez v0, :cond_14

    instance-of v0, p0, Lcom/google/android/gms/tagmanager/zzde;

    if-eqz v0, :cond_16

    check-cast p0, Lcom/google/android/gms/tagmanager/zzde;

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/zzde;->zzAV()Z

    move-result v0

    if-eqz v0, :cond_16

    :cond_14
    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method private static zzM(Ljava/lang/Object;)Z
    .registers 2

    instance-of v0, p0, Ljava/lang/Byte;

    if-nez v0, :cond_1c

    instance-of v0, p0, Ljava/lang/Short;

    if-nez v0, :cond_1c

    instance-of v0, p0, Ljava/lang/Integer;

    if-nez v0, :cond_1c

    instance-of v0, p0, Ljava/lang/Long;

    if-nez v0, :cond_1c

    instance-of v0, p0, Lcom/google/android/gms/tagmanager/zzde;

    if-eqz v0, :cond_1e

    check-cast p0, Lcom/google/android/gms/tagmanager/zzde;

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/zzde;->zzAW()Z

    move-result v0

    if-eqz v0, :cond_1e

    :cond_1c
    const/4 v0, 0x1

    :goto_1d
    return v0

    :cond_1e
    const/4 v0, 0x0

    goto :goto_1d
.end method

.method private static zzN(Ljava/lang/Object;)J
    .registers 3

    instance-of v0, p0, Ljava/lang/Number;

    if-eqz v0, :cond_b

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    :goto_a
    return-wide v0

    :cond_b
    const-string v0, "getInt64 received non-Number"

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    const-wide/16 v0, 0x0

    goto :goto_a
.end method

.method private static zzeZ(Ljava/lang/String;)Lcom/google/android/gms/tagmanager/zzde;
    .registers 3

    :try_start_0
    invoke-static {p0}, Lcom/google/android/gms/tagmanager/zzde;->zzeX(Ljava/lang/String;)Lcom/google/android/gms/tagmanager/zzde;
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v0

    :goto_4
    return-object v0

    :catch_5
    move-exception v0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Failed to convert \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\' to a number."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSQ:Lcom/google/android/gms/tagmanager/zzde;

    goto :goto_4
.end method

.method private static zzfa(Ljava/lang/String;)Ljava/lang/Long;
    .registers 3

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/zzdf;->zzeZ(Ljava/lang/String;)Lcom/google/android/gms/tagmanager/zzde;

    move-result-object v0

    sget-object v1, Lcom/google/android/gms/tagmanager/zzdf;->zzaSQ:Lcom/google/android/gms/tagmanager/zzde;

    if-ne v0, v1, :cond_b

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSO:Ljava/lang/Long;

    :goto_a
    return-object v0

    :cond_b
    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/zzde;->longValue()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    goto :goto_a
.end method

.method private static zzfc(Ljava/lang/String;)Ljava/lang/Boolean;
    .registers 2

    const-string v0, "true"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_a
    return-object v0

    :cond_b
    const-string v0, "false"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_16

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_a

    :cond_16
    sget-object v0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSS:Ljava/lang/Boolean;

    goto :goto_a
.end method

.method public static zzg(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/String;
    .registers 2

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/zzdf;->zzl(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdf;->zzF(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static zzh(Lcom/google/android/gms/internal/zzag$zza;)Lcom/google/android/gms/tagmanager/zzde;
    .registers 2

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/zzdf;->zzl(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdf;->zzG(Ljava/lang/Object;)Lcom/google/android/gms/tagmanager/zzde;

    move-result-object v0

    return-object v0
.end method

.method public static zzi(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/Long;
    .registers 2

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/zzdf;->zzl(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdf;->zzH(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method public static zzk(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/Boolean;
    .registers 2

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/zzdf;->zzl(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdf;->zzJ(Ljava/lang/Object;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public static zzl(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/Object;
    .registers 7

    const/4 v0, 0x0

    if-nez p0, :cond_6

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSN:Ljava/lang/Object;

    :goto_5
    return-object v0

    :cond_6
    iget v1, p0, Lcom/google/android/gms/internal/zzag$zza;->type:I

    packed-switch v1, :pswitch_data_e8

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Failed to convert a value of type: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/gms/internal/zzag$zza;->type:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSN:Ljava/lang/Object;

    goto :goto_5

    :pswitch_26
    iget-object v0, p0, Lcom/google/android/gms/internal/zzag$zza;->zziU:Ljava/lang/String;

    goto :goto_5

    :pswitch_29
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzag$zza;->zziV:[Lcom/google/android/gms/internal/zzag$zza;

    array-length v2, v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    iget-object v2, p0, Lcom/google/android/gms/internal/zzag$zza;->zziV:[Lcom/google/android/gms/internal/zzag$zza;

    array-length v3, v2

    :goto_34
    if-ge v0, v3, :cond_49

    aget-object v4, v2, v0

    invoke-static {v4}, Lcom/google/android/gms/tagmanager/zzdf;->zzl(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/Object;

    move-result-object v4

    sget-object v5, Lcom/google/android/gms/tagmanager/zzdf;->zzaSN:Ljava/lang/Object;

    if-ne v4, v5, :cond_43

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSN:Ljava/lang/Object;

    goto :goto_5

    :cond_43
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_34

    :cond_49
    move-object v0, v1

    goto :goto_5

    :pswitch_4b
    iget-object v1, p0, Lcom/google/android/gms/internal/zzag$zza;->zziW:[Lcom/google/android/gms/internal/zzag$zza;

    array-length v1, v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzag$zza;->zziX:[Lcom/google/android/gms/internal/zzag$zza;

    array-length v2, v2

    if-eq v1, v2, :cond_70

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Converting an invalid value to object: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzag$zza;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSN:Ljava/lang/Object;

    goto :goto_5

    :cond_70
    new-instance v1, Ljava/util/HashMap;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzag$zza;->zziX:[Lcom/google/android/gms/internal/zzag$zza;

    array-length v2, v2

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    :goto_78
    iget-object v2, p0, Lcom/google/android/gms/internal/zzag$zza;->zziW:[Lcom/google/android/gms/internal/zzag$zza;

    array-length v2, v2

    if-ge v0, v2, :cond_9f

    iget-object v2, p0, Lcom/google/android/gms/internal/zzag$zza;->zziW:[Lcom/google/android/gms/internal/zzag$zza;

    aget-object v2, v2, v0

    invoke-static {v2}, Lcom/google/android/gms/tagmanager/zzdf;->zzl(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/Object;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzag$zza;->zziX:[Lcom/google/android/gms/internal/zzag$zza;

    aget-object v3, v3, v0

    invoke-static {v3}, Lcom/google/android/gms/tagmanager/zzdf;->zzl(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/Object;

    move-result-object v3

    sget-object v4, Lcom/google/android/gms/tagmanager/zzdf;->zzaSN:Ljava/lang/Object;

    if-eq v2, v4, :cond_95

    sget-object v4, Lcom/google/android/gms/tagmanager/zzdf;->zzaSN:Ljava/lang/Object;

    if-ne v3, v4, :cond_99

    :cond_95
    sget-object v0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSN:Ljava/lang/Object;

    goto/16 :goto_5

    :cond_99
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v0, v0, 0x1

    goto :goto_78

    :cond_9f
    move-object v0, v1

    goto/16 :goto_5

    :pswitch_a2
    const-string v0, "Trying to convert a macro reference to object"

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSN:Ljava/lang/Object;

    goto/16 :goto_5

    :pswitch_ab
    const-string v0, "Trying to convert a function id to object"

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSN:Ljava/lang/Object;

    goto/16 :goto_5

    :pswitch_b4
    iget-wide v0, p0, Lcom/google/android/gms/internal/zzag$zza;->zzja:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    goto/16 :goto_5

    :pswitch_bc
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v2, p0, Lcom/google/android/gms/internal/zzag$zza;->zzjc:[Lcom/google/android/gms/internal/zzag$zza;

    array-length v3, v2

    :goto_c4
    if-ge v0, v3, :cond_da

    aget-object v4, v2, v0

    invoke-static {v4}, Lcom/google/android/gms/tagmanager/zzdf;->zzg(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lcom/google/android/gms/tagmanager/zzdf;->zzaSR:Ljava/lang/String;

    if-ne v4, v5, :cond_d4

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdf;->zzaSN:Ljava/lang/Object;

    goto/16 :goto_5

    :cond_d4
    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    add-int/lit8 v0, v0, 0x1

    goto :goto_c4

    :cond_da
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_5

    :pswitch_e0
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzag$zza;->zzjb:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto/16 :goto_5

    :pswitch_data_e8
    .packed-switch 0x1
        :pswitch_26
        :pswitch_29
        :pswitch_4b
        :pswitch_a2
        :pswitch_ab
        :pswitch_b4
        :pswitch_bc
        :pswitch_e0
    .end packed-switch
.end method
