.class public Lcom/google/android/gms/analytics/internal/zzaf;
.super Lcom/google/android/gms/analytics/internal/zzd;


# static fields
.field private static zzOl:Ljava/lang/String;

.field private static zzOm:Ljava/lang/String;

.field private static zzOn:Lcom/google/android/gms/analytics/internal/zzaf;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-string v0, "3"

    sput-object v0, Lcom/google/android/gms/analytics/internal/zzaf;->zzOl:Ljava/lang/String;

    const-string v0, "01VDIWEA?"

    sput-object v0, Lcom/google/android/gms/analytics/internal/zzaf;->zzOm:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/analytics/internal/zzf;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/google/android/gms/analytics/internal/zzd;-><init>(Lcom/google/android/gms/analytics/internal/zzf;)V

    return-void
.end method

.method public static zzkq()Lcom/google/android/gms/analytics/internal/zzaf;
    .registers 1

    sget-object v0, Lcom/google/android/gms/analytics/internal/zzaf;->zzOn:Lcom/google/android/gms/analytics/internal/zzaf;

    return-object v0
.end method


# virtual methods
.method public zza(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 8

    sget-object v0, Lcom/google/android/gms/analytics/internal/zzy;->zzNa:Lcom/google/android/gms/analytics/internal/zzy$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzy$zza;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_15

    invoke-static {p2, p3, p4, p5}, Lcom/google/android/gms/analytics/internal/zzaf;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    :cond_15
    const/4 v0, 0x5

    if-lt p1, v0, :cond_1b

    invoke-virtual/range {p0 .. p5}, Lcom/google/android/gms/analytics/internal/zzaf;->zzb(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_1b
    return-void
.end method

.method public zza(Lcom/google/android/gms/analytics/internal/zzab;Ljava/lang/String;)V
    .registers 6

    if-nez p2, :cond_4

    const-string p2, "no reason provided"

    :cond_4
    if-eqz p1, :cond_21

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzab;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_a
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Discarding hit. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzaf;->zzd(Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :cond_21
    const-string v0, "no hit data"

    goto :goto_a
.end method

.method public declared-synchronized zzb(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 11

    const/16 v4, 0x400

    const/4 v0, 0x0

    monitor-enter p0

    :try_start_4
    invoke-static {p2}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    if-gez p1, :cond_a6

    :goto_9
    sget-object v1, Lcom/google/android/gms/analytics/internal/zzaf;->zzOm:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lt v0, v1, :cond_a3

    sget-object v0, Lcom/google/android/gms/analytics/internal/zzaf;->zzOm:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    move v1, v0

    :goto_1a
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzaf;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjl()Z

    move-result v0

    if-eqz v0, :cond_90

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzaf;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjk()Z

    move-result v0

    if-eqz v0, :cond_8d

    const/16 v0, 0x50

    :goto_30
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/google/android/gms/analytics/internal/zzaf;->zzOl:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/google/android/gms/analytics/internal/zzaf;->zzOm:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/google/android/gms/analytics/internal/zze;->VERSION:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0, p3}, Lcom/google/android/gms/analytics/internal/zzaf;->zzk(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p4}, Lcom/google/android/gms/analytics/internal/zzaf;->zzk(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, p5}, Lcom/google/android/gms/analytics/internal/zzaf;->zzk(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {p2, v1, v2, v3}, Lcom/google/android/gms/analytics/internal/zzaf;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-le v1, v4, :cond_7a

    const/4 v1, 0x0

    const/16 v2, 0x400

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_7a
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzaf;->zzia()Lcom/google/android/gms/analytics/internal/zzf;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzf;->zzit()Lcom/google/android/gms/analytics/internal/zzai;

    move-result-object v1

    if-eqz v1, :cond_8b

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzai;->zzkD()Lcom/google/android/gms/analytics/internal/zzai$zza;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/android/gms/analytics/internal/zzai$zza;->zzbl(Ljava/lang/String;)V
    :try_end_8b
    .catchall {:try_start_4 .. :try_end_8b} :catchall_a0

    :cond_8b
    monitor-exit p0

    return-void

    :cond_8d
    const/16 v0, 0x43

    goto :goto_30

    :cond_90
    :try_start_90
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzaf;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjk()Z
    :try_end_97
    .catchall {:try_start_90 .. :try_end_97} :catchall_a0

    move-result v0

    if-eqz v0, :cond_9d

    const/16 v0, 0x70

    goto :goto_30

    :cond_9d
    const/16 v0, 0x63

    goto :goto_30

    :catchall_a0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_a3
    move v1, v0

    goto/16 :goto_1a

    :cond_a6
    move v0, p1

    goto/16 :goto_9
.end method

.method public zzh(Ljava/util/Map;Ljava/lang/String;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    if-nez p2, :cond_4

    const-string p2, "no reason provided"

    :cond_4
    if-eqz p1, :cond_5d

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_13
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_42

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-lez v1, :cond_2a

    const/16 v1, 0x2c

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_2a
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x3d

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_13

    :cond_42
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_46
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Discarding hit. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzaf;->zzd(Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :cond_5d
    const-string v0, "no hit data"

    goto :goto_46
.end method

.method protected zzhB()V
    .registers 3

    const-class v1, Lcom/google/android/gms/analytics/internal/zzaf;

    monitor-enter v1

    :try_start_3
    sput-object p0, Lcom/google/android/gms/analytics/internal/zzaf;->zzOn:Lcom/google/android/gms/analytics/internal/zzaf;

    monitor-exit v1

    return-void

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method protected zzk(Ljava/lang/Object;)Ljava/lang/String;
    .registers 10

    const-wide/high16 v6, 0x4024000000000000L

    if-nez p1, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    instance-of v0, p1, Ljava/lang/Integer;

    if-eqz v0, :cond_a7

    new-instance v1, Ljava/lang/Long;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    int-to-long v2, v0

    invoke-direct {v1, v2, v3}, Ljava/lang/Long;-><init>(J)V

    :goto_16
    instance-of v0, v1, Ljava/lang/Long;

    if-eqz v0, :cond_8b

    move-object v0, v1

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    move-result-wide v2

    const-wide/16 v4, 0x64

    cmp-long v0, v2, v4

    if-gez v0, :cond_30

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_5

    :cond_30
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x2d

    if-ne v0, v2, :cond_88

    const-string v0, "-"

    :goto_3f
    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    int-to-double v4, v3

    invoke-static {v6, v7, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Math;->round(D)J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, "..."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    int-to-double v0, v0

    invoke-static {v6, v7, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    const-wide/high16 v4, 0x3ff0000000000000L

    sub-double/2addr v0, v4

    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_5

    :cond_88
    const-string v0, ""

    goto :goto_3f

    :cond_8b
    instance-of v0, v1, Ljava/lang/Boolean;

    if-eqz v0, :cond_95

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_5

    :cond_95
    instance-of v0, v1, Ljava/lang/Throwable;

    if-eqz v0, :cond_a3

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_5

    :cond_a3
    const-string v0, "-"

    goto/16 :goto_5

    :cond_a7
    move-object v1, p1

    goto/16 :goto_16
.end method
