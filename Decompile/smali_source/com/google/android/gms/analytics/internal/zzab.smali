.class public Lcom/google/android/gms/analytics/internal/zzab;
.super Ljava/lang/Object;


# instance fields
.field private final zzNY:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/analytics/internal/Command;",
            ">;"
        }
    .end annotation
.end field

.field private final zzNZ:J

.field private final zzOa:J

.field private final zzOb:I

.field private final zzOc:Z

.field private final zzOd:Ljava/lang/String;

.field private final zzvs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/gms/analytics/internal/zzc;Ljava/util/Map;JZ)V
    .registers 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/analytics/internal/zzc;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;JZ)V"
        }
    .end annotation

    const-wide/16 v6, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p3

    move/from16 v5, p5

    invoke-direct/range {v0 .. v9}, Lcom/google/android/gms/analytics/internal/zzab;-><init>(Lcom/google/android/gms/analytics/internal/zzc;Ljava/util/Map;JZJILjava/util/List;)V

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/analytics/internal/zzc;Ljava/util/Map;JZJI)V
    .registers 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/analytics/internal/zzc;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;JZJI)V"
        }
    .end annotation

    const/4 v9, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p3

    move v5, p5

    move-wide/from16 v6, p6

    move/from16 v8, p8

    invoke-direct/range {v0 .. v9}, Lcom/google/android/gms/analytics/internal/zzab;-><init>(Lcom/google/android/gms/analytics/internal/zzc;Ljava/util/Map;JZJILjava/util/List;)V

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/analytics/internal/zzc;Ljava/util/Map;JZJILjava/util/List;)V
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/analytics/internal/zzc;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;JZJI",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/analytics/internal/Command;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p2}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    iput-wide p3, p0, Lcom/google/android/gms/analytics/internal/zzab;->zzOa:J

    iput-boolean p5, p0, Lcom/google/android/gms/analytics/internal/zzab;->zzOc:Z

    iput-wide p6, p0, Lcom/google/android/gms/analytics/internal/zzab;->zzNZ:J

    iput p8, p0, Lcom/google/android/gms/analytics/internal/zzab;->zzOb:I

    if-eqz p9, :cond_55

    move-object v0, p9

    :goto_14
    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzab;->zzNY:Ljava/util/List;

    invoke-static {p9}, Lcom/google/android/gms/analytics/internal/zzab;->zze(Ljava/util/List;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzab;->zzOd:Ljava/lang/String;

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_29
    :goto_29
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_58

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/gms/analytics/internal/zzab;->zzj(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_29

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-static {p1, v3}, Lcom/google/android/gms/analytics/internal/zzab;->zza(Lcom/google/android/gms/analytics/internal/zzc;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_29

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/google/android/gms/analytics/internal/zzab;->zzb(Lcom/google/android/gms/analytics/internal/zzc;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_29

    :cond_55
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    goto :goto_14

    :cond_58
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_60
    :goto_60
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/gms/analytics/internal/zzab;->zzj(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_60

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-static {p1, v3}, Lcom/google/android/gms/analytics/internal/zzab;->zza(Lcom/google/android/gms/analytics/internal/zzc;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_60

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/google/android/gms/analytics/internal/zzab;->zzb(Lcom/google/android/gms/analytics/internal/zzc;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_60

    :cond_8c
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzab;->zzOd:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_b4

    const-string v0, "_v"

    iget-object v2, p0, Lcom/google/android/gms/analytics/internal/zzab;->zzOd:Ljava/lang/String;

    invoke-static {v1, v0, v2}, Lcom/google/android/gms/analytics/internal/zzam;->zzb(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzab;->zzOd:Ljava/lang/String;

    const-string v2, "ma4.0.0"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_af

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzab;->zzOd:Ljava/lang/String;

    const-string v2, "ma4.0.1"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b4

    :cond_af
    const-string v0, "adid"

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_b4
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzab;->zzvs:Ljava/util/Map;

    return-void
.end method

.method public static zza(Lcom/google/android/gms/analytics/internal/zzc;Lcom/google/android/gms/analytics/internal/zzab;Ljava/util/Map;)Lcom/google/android/gms/analytics/internal/zzab;
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/analytics/internal/zzc;",
            "Lcom/google/android/gms/analytics/internal/zzab;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/android/gms/analytics/internal/zzab;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/analytics/internal/zzab;

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzab;->zzkk()J

    move-result-wide v3

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzab;->zzkm()Z

    move-result v5

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzab;->zzkj()J

    move-result-wide v6

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzab;->zzki()I

    move-result v8

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzab;->zzkl()Ljava/util/List;

    move-result-object v9

    move-object v1, p0

    move-object v2, p2

    invoke-direct/range {v0 .. v9}, Lcom/google/android/gms/analytics/internal/zzab;-><init>(Lcom/google/android/gms/analytics/internal/zzc;Ljava/util/Map;JZJILjava/util/List;)V

    return-object v0
.end method

.method private static zza(Lcom/google/android/gms/analytics/internal/zzc;Ljava/lang/Object;)Ljava/lang/String;
    .registers 7

    const/4 v1, 0x0

    const/16 v4, 0x100

    if-nez p1, :cond_7

    move-object v0, v1

    :cond_6
    :goto_6
    return-object v0

    :cond_7
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "&"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_18

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    :cond_18
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-le v2, v4, :cond_2c

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    const-string v3, "Hit param name is too long and will be trimmed"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v3, v2, v0}, Lcom/google/android/gms/analytics/internal/zzc;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_2c
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_6

    move-object v0, v1

    goto :goto_6
.end method

.method private static zzb(Lcom/google/android/gms/analytics/internal/zzc;Ljava/lang/Object;)Ljava/lang/String;
    .registers 6

    const/16 v3, 0x2000

    if-nez p1, :cond_1b

    const-string v0, ""

    :goto_6
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-le v1, v3, :cond_1a

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    const-string v2, "Hit param value is too long and will be trimmed"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v2, v1, v0}, Lcom/google/android/gms/analytics/internal/zzc;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_1a
    return-object v0

    :cond_1b
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method

.method private static zze(Ljava/util/List;)Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/analytics/internal/Command;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    const/4 v1, 0x0

    if-eqz p0, :cond_2c

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_7
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/analytics/internal/Command;

    const-string v3, "appendVersion"

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/Command;->getId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/Command;->getValue()Ljava/lang/String;

    move-result-object v0

    :goto_23
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2a

    :goto_29
    return-object v1

    :cond_2a
    move-object v1, v0

    goto :goto_29

    :cond_2c
    move-object v0, v1

    goto :goto_23
.end method

.method private static zzj(Ljava/lang/Object;)Z
    .registers 3

    if-nez p0, :cond_4

    const/4 v0, 0x0

    :goto_3
    return v0

    :cond_4
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "&"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    goto :goto_3
.end method

.method private zzo(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzx;->zzcs(Ljava/lang/String;)Ljava/lang/String;

    const-string v0, "&"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1c

    const/4 v0, 0x1

    :goto_c
    const-string v1, "Short param name required"

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/zzx;->zzb(ZLjava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzab;->zzvs:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_1e

    :goto_1b
    return-object v0

    :cond_1c
    const/4 v0, 0x0

    goto :goto_c

    :cond_1e
    move-object v0, p2

    goto :goto_1b
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 7

    const-wide/16 v4, 0x0

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v0, "ht="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-wide v2, p0, Lcom/google/android/gms/analytics/internal/zzab;->zzOa:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    iget-wide v2, p0, Lcom/google/android/gms/analytics/internal/zzab;->zzNZ:J

    cmp-long v0, v2, v4

    if-eqz v0, :cond_23

    const-string v0, ", dbId="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-wide v2, p0, Lcom/google/android/gms/analytics/internal/zzab;->zzNZ:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    :cond_23
    iget v0, p0, Lcom/google/android/gms/analytics/internal/zzab;->zzOb:I

    int-to-long v2, v0

    cmp-long v0, v2, v4

    if-eqz v0, :cond_35

    const-string v0, ", appUID="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget v2, p0, Lcom/google/android/gms/analytics/internal/zzab;->zzOb:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    :cond_35
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/google/android/gms/analytics/internal/zzab;->zzvs:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_47
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v3, ", "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v3, "="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-object v3, p0, Lcom/google/android/gms/analytics/internal/zzab;->zzvs:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_47

    :cond_6c
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public zzki()I
    .registers 2

    iget v0, p0, Lcom/google/android/gms/analytics/internal/zzab;->zzOb:I

    return v0
.end method

.method public zzkj()J
    .registers 3

    iget-wide v0, p0, Lcom/google/android/gms/analytics/internal/zzab;->zzNZ:J

    return-wide v0
.end method

.method public zzkk()J
    .registers 3

    iget-wide v0, p0, Lcom/google/android/gms/analytics/internal/zzab;->zzOa:J

    return-wide v0
.end method

.method public zzkl()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/analytics/internal/Command;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzab;->zzNY:Ljava/util/List;

    return-object v0
.end method

.method public zzkm()Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/analytics/internal/zzab;->zzOc:Z

    return v0
.end method

.method public zzkn()J
    .registers 3

    const-string v0, "_s"

    const-string v1, "0"

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/analytics/internal/zzab;->zzo(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/analytics/internal/zzam;->zzbo(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public zzko()Ljava/lang/String;
    .registers 3

    const-string v0, "_m"

    const-string v1, ""

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/analytics/internal/zzab;->zzo(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public zzn()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzab;->zzvs:Ljava/util/Map;

    return-object v0
.end method
