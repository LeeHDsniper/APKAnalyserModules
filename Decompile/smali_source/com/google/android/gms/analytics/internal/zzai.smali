.class public Lcom/google/android/gms/analytics/internal/zzai;
.super Lcom/google/android/gms/analytics/internal/zzd;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/analytics/internal/zzai$1;,
        Lcom/google/android/gms/analytics/internal/zzai$zza;
    }
.end annotation


# instance fields
.field private zzOw:Landroid/content/SharedPreferences;

.field private zzOx:J

.field private zzOy:J

.field private final zzOz:Lcom/google/android/gms/analytics/internal/zzai$zza;


# direct methods
.method protected constructor <init>(Lcom/google/android/gms/analytics/internal/zzf;)V
    .registers 9

    invoke-direct {p0, p1}, Lcom/google/android/gms/analytics/internal/zzd;-><init>(Lcom/google/android/gms/analytics/internal/zzf;)V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/android/gms/analytics/internal/zzai;->zzOy:J

    new-instance v1, Lcom/google/android/gms/analytics/internal/zzai$zza;

    const-string v3, "monitoring"

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzai;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjQ()J

    move-result-wide v4

    const/4 v6, 0x0

    move-object v2, p0

    invoke-direct/range {v1 .. v6}, Lcom/google/android/gms/analytics/internal/zzai$zza;-><init>(Lcom/google/android/gms/analytics/internal/zzai;Ljava/lang/String;JLcom/google/android/gms/analytics/internal/zzai$1;)V

    iput-object v1, p0, Lcom/google/android/gms/analytics/internal/zzai;->zzOz:Lcom/google/android/gms/analytics/internal/zzai$zza;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/analytics/internal/zzai;)Landroid/content/SharedPreferences;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzai;->zzOw:Landroid/content/SharedPreferences;

    return-object v0
.end method


# virtual methods
.method public zzbk(Ljava/lang/String;)V
    .registers 4

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzai;->zzic()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzai;->zzio()V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzai;->zzOw:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_23

    const-string v1, "installation_campaign"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    :goto_17
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v0

    if-nez v0, :cond_22

    const-string v0, "Failed to commit campaign data"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzai;->zzbb(Ljava/lang/String;)V

    :cond_22
    return-void

    :cond_23
    const-string v1, "installation_campaign"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_17
.end method

.method protected zzhB()V
    .registers 4

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzai;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "com.google.android.gms.analytics.prefs"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzai;->zzOw:Landroid/content/SharedPreferences;

    return-void
.end method

.method public zzkA()J
    .registers 5

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzai;->zzic()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzai;->zzio()V

    iget-wide v0, p0, Lcom/google/android/gms/analytics/internal/zzai;->zzOy:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_1a

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzai;->zzOw:Landroid/content/SharedPreferences;

    const-string v1, "last_dispatch"

    const-wide/16 v2, 0x0

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/analytics/internal/zzai;->zzOy:J

    :cond_1a
    iget-wide v0, p0, Lcom/google/android/gms/analytics/internal/zzai;->zzOy:J

    return-wide v0
.end method

.method public zzkB()V
    .registers 5

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzai;->zzic()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzai;->zzio()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzai;->zzid()Lcom/google/android/gms/internal/zzlm;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzlm;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/google/android/gms/analytics/internal/zzai;->zzOw:Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v3, "last_dispatch"

    invoke-interface {v2, v3, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    iput-wide v0, p0, Lcom/google/android/gms/analytics/internal/zzai;->zzOy:J

    return-void
.end method

.method public zzkC()Ljava/lang/String;
    .registers 4

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzai;->zzic()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzai;->zzio()V

    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzai;->zzOw:Landroid/content/SharedPreferences;

    const-string v2, "installation_campaign"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_16

    :goto_15
    return-object v0

    :cond_16
    move-object v0, v1

    goto :goto_15
.end method

.method public zzkD()Lcom/google/android/gms/analytics/internal/zzai$zza;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzai;->zzOz:Lcom/google/android/gms/analytics/internal/zzai$zza;

    return-object v0
.end method

.method public zzky()J
    .registers 5

    const-wide/16 v2, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzai;->zzic()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzai;->zzio()V

    iget-wide v0, p0, Lcom/google/android/gms/analytics/internal/zzai;->zzOx:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_1c

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzai;->zzOw:Landroid/content/SharedPreferences;

    const-string v1, "first_run"

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_1f

    iput-wide v0, p0, Lcom/google/android/gms/analytics/internal/zzai;->zzOx:J

    :cond_1c
    :goto_1c
    iget-wide v0, p0, Lcom/google/android/gms/analytics/internal/zzai;->zzOx:J

    return-wide v0

    :cond_1f
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzai;->zzid()Lcom/google/android/gms/internal/zzlm;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzlm;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/google/android/gms/analytics/internal/zzai;->zzOw:Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v3, "first_run"

    invoke-interface {v2, v3, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v2

    if-nez v2, :cond_3d

    const-string v2, "Failed to commit first run time"

    invoke-virtual {p0, v2}, Lcom/google/android/gms/analytics/internal/zzai;->zzbb(Ljava/lang/String;)V

    :cond_3d
    iput-wide v0, p0, Lcom/google/android/gms/analytics/internal/zzai;->zzOx:J

    goto :goto_1c
.end method

.method public zzkz()Lcom/google/android/gms/analytics/internal/zzaj;
    .registers 5

    new-instance v0, Lcom/google/android/gms/analytics/internal/zzaj;

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzai;->zzid()Lcom/google/android/gms/internal/zzlm;

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzai;->zzky()J

    move-result-wide v2

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/analytics/internal/zzaj;-><init>(Lcom/google/android/gms/internal/zzlm;J)V

    return-object v0
.end method
