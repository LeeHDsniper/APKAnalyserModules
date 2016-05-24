.class public final Lcom/google/android/gms/analytics/internal/zzai$zza;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/analytics/internal/zzai;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "zza"
.end annotation


# instance fields
.field private final mName:Ljava/lang/String;

.field private final zzOA:J

.field final synthetic zzOB:Lcom/google/android/gms/analytics/internal/zzai;


# direct methods
.method private constructor <init>(Lcom/google/android/gms/analytics/internal/zzai;Ljava/lang/String;J)V
    .registers 8

    iput-object p1, p0, Lcom/google/android/gms/analytics/internal/zzai$zza;->zzOB:Lcom/google/android/gms/analytics/internal/zzai;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p2}, Lcom/google/android/gms/common/internal/zzx;->zzcs(Ljava/lang/String;)Ljava/lang/String;

    const-wide/16 v0, 0x0

    cmp-long v0, p3, v0

    if-lez v0, :cond_17

    const/4 v0, 0x1

    :goto_f
    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzZ(Z)V

    iput-object p2, p0, Lcom/google/android/gms/analytics/internal/zzai$zza;->mName:Ljava/lang/String;

    iput-wide p3, p0, Lcom/google/android/gms/analytics/internal/zzai$zza;->zzOA:J

    return-void

    :cond_17
    const/4 v0, 0x0

    goto :goto_f
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/analytics/internal/zzai;Ljava/lang/String;JLcom/google/android/gms/analytics/internal/zzai$1;)V
    .registers 7

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/gms/analytics/internal/zzai$zza;-><init>(Lcom/google/android/gms/analytics/internal/zzai;Ljava/lang/String;J)V

    return-void
.end method

.method private zzkE()V
    .registers 5

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzai$zza;->zzOB:Lcom/google/android/gms/analytics/internal/zzai;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzai;->zzid()Lcom/google/android/gms/internal/zzlm;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzlm;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/google/android/gms/analytics/internal/zzai$zza;->zzOB:Lcom/google/android/gms/analytics/internal/zzai;

    invoke-static {v2}, Lcom/google/android/gms/analytics/internal/zzai;->zza(Lcom/google/android/gms/analytics/internal/zzai;)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzai$zza;->zzkJ()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzai$zza;->zzkK()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzai$zza;->zzkI()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method private zzkF()J
    .registers 6

    const-wide/16 v0, 0x0

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzai$zza;->zzkH()J

    move-result-wide v2

    cmp-long v4, v2, v0

    if-nez v4, :cond_b

    :goto_a
    return-wide v0

    :cond_b
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzai$zza;->zzOB:Lcom/google/android/gms/analytics/internal/zzai;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzai;->zzid()Lcom/google/android/gms/internal/zzlm;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzlm;->currentTimeMillis()J

    move-result-wide v0

    sub-long v0, v2, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    move-result-wide v0

    goto :goto_a
.end method

.method private zzkH()J
    .registers 5

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzai$zza;->zzOB:Lcom/google/android/gms/analytics/internal/zzai;

    invoke-static {v0}, Lcom/google/android/gms/analytics/internal/zzai;->zza(Lcom/google/android/gms/analytics/internal/zzai;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzai$zza;->zzkI()Ljava/lang/String;

    move-result-object v1

    const-wide/16 v2, 0x0

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method private zzkI()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzai$zza;->mName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":start"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private zzkJ()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzai$zza;->mName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":count"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public zzbl(Ljava/lang/String;)V
    .registers 12

    const-wide v6, 0x7fffffffffffffffL

    const-wide/16 v8, 0x1

    const-wide/16 v4, 0x0

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzai$zza;->zzkH()J

    move-result-wide v0

    cmp-long v0, v0, v4

    if-nez v0, :cond_14

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzai$zza;->zzkE()V

    :cond_14
    if-nez p1, :cond_18

    const-string p1, ""

    :cond_18
    monitor-enter p0

    :try_start_19
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzai$zza;->zzOB:Lcom/google/android/gms/analytics/internal/zzai;

    invoke-static {v0}, Lcom/google/android/gms/analytics/internal/zzai;->zza(Lcom/google/android/gms/analytics/internal/zzai;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzai$zza;->zzkJ()Ljava/lang/String;

    move-result-object v1

    const-wide/16 v2, 0x0

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    cmp-long v0, v2, v4

    if-gtz v0, :cond_4c

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzai$zza;->zzOB:Lcom/google/android/gms/analytics/internal/zzai;

    invoke-static {v0}, Lcom/google/android/gms/analytics/internal/zzai;->zza(Lcom/google/android/gms/analytics/internal/zzai;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzai$zza;->zzkK()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzai$zza;->zzkJ()Ljava/lang/String;

    move-result-object v1

    const-wide/16 v2, 0x1

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    monitor-exit p0

    :goto_4b
    return-void

    :cond_4c
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v0

    and-long/2addr v0, v6

    const-wide v4, 0x7fffffffffffffffL

    add-long v6, v2, v8

    div-long/2addr v4, v6

    cmp-long v0, v0, v4

    if-gez v0, :cond_85

    const/4 v0, 0x1

    :goto_62
    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzai$zza;->zzOB:Lcom/google/android/gms/analytics/internal/zzai;

    invoke-static {v1}, Lcom/google/android/gms/analytics/internal/zzai;->zza(Lcom/google/android/gms/analytics/internal/zzai;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    if-eqz v0, :cond_75

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzai$zza;->zzkK()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    :cond_75
    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzai$zza;->zzkJ()Ljava/lang/String;

    move-result-object v0

    add-long/2addr v2, v8

    invoke-interface {v1, v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    monitor-exit p0

    goto :goto_4b

    :catchall_82
    move-exception v0

    monitor-exit p0
    :try_end_84
    .catchall {:try_start_19 .. :try_end_84} :catchall_82

    throw v0

    :cond_85
    const/4 v0, 0x0

    goto :goto_62
.end method

.method public zzkG()Landroid/util/Pair;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    const-wide/16 v8, 0x0

    const/4 v0, 0x0

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzai$zza;->zzkF()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/google/android/gms/analytics/internal/zzai$zza;->zzOA:J

    cmp-long v1, v2, v4

    if-gez v1, :cond_e

    :cond_d
    :goto_d
    return-object v0

    :cond_e
    iget-wide v4, p0, Lcom/google/android/gms/analytics/internal/zzai$zza;->zzOA:J

    const-wide/16 v6, 0x2

    mul-long/2addr v4, v6

    cmp-long v1, v2, v4

    if-lez v1, :cond_1b

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzai$zza;->zzkE()V

    goto :goto_d

    :cond_1b
    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzai$zza;->zzOB:Lcom/google/android/gms/analytics/internal/zzai;

    invoke-static {v1}, Lcom/google/android/gms/analytics/internal/zzai;->zza(Lcom/google/android/gms/analytics/internal/zzai;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzai$zza;->zzkK()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/analytics/internal/zzai$zza;->zzOB:Lcom/google/android/gms/analytics/internal/zzai;

    invoke-static {v2}, Lcom/google/android/gms/analytics/internal/zzai;->zza(Lcom/google/android/gms/analytics/internal/zzai;)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzai$zza;->zzkJ()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v8, v9}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzai$zza;->zzkE()V

    if-eqz v1, :cond_d

    cmp-long v4, v2, v8

    if-lez v4, :cond_d

    new-instance v0, Landroid/util/Pair;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_d
.end method

.method protected zzkK()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzai$zza;->mName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":value"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
