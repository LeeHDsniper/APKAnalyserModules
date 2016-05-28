.class public Lcom/google/android/gms/internal/zzhm;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field final zzGY:Ljava/lang/String;

.field zzHl:J

.field zzHm:J

.field zzHn:I

.field zzHo:I

.field zzHp:I

.field private final zzpc:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 6

    const-wide/16 v2, -0x1

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzhm;->zzHl:J

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzhm;->zzHm:J

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzhm;->zzHn:I

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhm;->zzpc:Ljava/lang/Object;

    iput v1, p0, Lcom/google/android/gms/internal/zzhm;->zzHo:I

    iput v1, p0, Lcom/google/android/gms/internal/zzhm;->zzHp:I

    iput-object p1, p0, Lcom/google/android/gms/internal/zzhm;->zzGY:Ljava/lang/String;

    return-void
.end method

.method public static zzG(Landroid/content/Context;)Z
    .registers 6

    const/4 v0, 0x0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "Theme.Translucent"

    const-string v3, "style"

    const-string v4, "android"

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_17

    const-string v1, "Please set theme of AdActivity to @android:style/Theme.Translucent to enable transparent background interstitial ad."

    invoke-static {v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaD(Ljava/lang/String;)V

    :goto_16
    return v0

    :cond_17
    new-instance v2, Landroid/content/ComponentName;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "com.google.android.gms.ads.AdActivity"

    invoke-direct {v2, v3, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_22
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v2, v4}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    move-result-object v2

    iget v2, v2, Landroid/content/pm/ActivityInfo;->theme:I

    if-ne v1, v2, :cond_31

    const/4 v0, 0x1

    goto :goto_16

    :cond_31
    const-string v1, "Please set theme of AdActivity to @android:style/Theme.Translucent to enable transparent background interstitial ad."

    invoke-static {v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaD(Ljava/lang/String;)V
    :try_end_36
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_22 .. :try_end_36} :catch_37

    goto :goto_16

    :catch_37
    move-exception v1

    const-string v1, "Fail to fetch AdActivity theme"

    invoke-static {v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    const-string v1, "Please set theme of AdActivity to @android:style/Theme.Translucent to enable transparent background interstitial ad."

    invoke-static {v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaD(Ljava/lang/String;)V

    goto :goto_16
.end method


# virtual methods
.method public zzb(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;J)V
    .registers 10

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhm;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-wide v2, p0, Lcom/google/android/gms/internal/zzhm;->zzHm:J

    const-wide/16 v4, -0x1

    cmp-long v0, v2, v4

    if-nez v0, :cond_23

    iput-wide p2, p0, Lcom/google/android/gms/internal/zzhm;->zzHm:J

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzhm;->zzHm:J

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzhm;->zzHl:J

    :goto_11
    iget-object v0, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->extras:Landroid/os/Bundle;

    if-eqz v0, :cond_29

    iget-object v0, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->extras:Landroid/os/Bundle;

    const-string v2, "gw"

    const/4 v3, 0x2

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_29

    monitor-exit v1

    :goto_22
    return-void

    :cond_23
    iput-wide p2, p0, Lcom/google/android/gms/internal/zzhm;->zzHl:J

    goto :goto_11

    :catchall_26
    move-exception v0

    monitor-exit v1
    :try_end_28
    .catchall {:try_start_3 .. :try_end_28} :catchall_26

    throw v0

    :cond_29
    :try_start_29
    iget v0, p0, Lcom/google/android/gms/internal/zzhm;->zzHn:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzhm;->zzHn:I

    monitor-exit v1
    :try_end_30
    .catchall {:try_start_29 .. :try_end_30} :catchall_26

    goto :goto_22
.end method

.method public zze(Landroid/content/Context;Ljava/lang/String;)Landroid/os/Bundle;
    .registers 9

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhm;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v2, "session_id"

    iget-object v3, p0, Lcom/google/android/gms/internal/zzhm;->zzGY:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "basets"

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzhm;->zzHm:J

    invoke-virtual {v0, v2, v4, v5}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v2, "currts"

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzhm;->zzHl:J

    invoke-virtual {v0, v2, v4, v5}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v2, "seq_num"

    invoke-virtual {v0, v2, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "preqs"

    iget v3, p0, Lcom/google/android/gms/internal/zzhm;->zzHn:I

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v2, "pclick"

    iget v3, p0, Lcom/google/android/gms/internal/zzhm;->zzHo:I

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v2, "pimp"

    iget v3, p0, Lcom/google/android/gms/internal/zzhm;->zzHp:I

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v2, "support_transparent_background"

    invoke-static {p1}, Lcom/google/android/gms/internal/zzhm;->zzG(Landroid/content/Context;)Z

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    monitor-exit v1

    return-object v0

    :catchall_42
    move-exception v0

    monitor-exit v1
    :try_end_44
    .catchall {:try_start_3 .. :try_end_44} :catchall_42

    throw v0
.end method

.method public zzfT()V
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhm;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget v0, p0, Lcom/google/android/gms/internal/zzhm;->zzHp:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzhm;->zzHp:I

    monitor-exit v1

    return-void

    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v0
.end method

.method public zzfU()V
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhm;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget v0, p0, Lcom/google/android/gms/internal/zzhm;->zzHo:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzhm;->zzHo:I

    monitor-exit v1

    return-void

    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v0
.end method

.method public zzgl()J
    .registers 3

    iget-wide v0, p0, Lcom/google/android/gms/internal/zzhm;->zzHm:J

    return-wide v0
.end method
