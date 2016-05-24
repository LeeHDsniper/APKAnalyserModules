.class public Lcom/google/android/gms/analytics/CampaignTrackingReceiver;
.super Landroid/content/BroadcastReceiver;


# static fields
.field static zzKc:Lcom/google/android/gms/internal/zzqd;

.field static zzKd:Ljava/lang/Boolean;

.field static zzpm:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/analytics/CampaignTrackingReceiver;->zzpm:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method public static zzV(Landroid/content/Context;)Z
    .registers 3

    invoke-static {p0}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/google/android/gms/analytics/CampaignTrackingReceiver;->zzKd:Ljava/lang/Boolean;

    if-eqz v0, :cond_e

    sget-object v0, Lcom/google/android/gms/analytics/CampaignTrackingReceiver;->zzKd:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    :goto_d
    return v0

    :cond_e
    const-class v0, Lcom/google/android/gms/analytics/CampaignTrackingReceiver;

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lcom/google/android/gms/analytics/internal/zzam;->zza(Landroid/content/Context;Ljava/lang/Class;Z)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    sput-object v1, Lcom/google/android/gms/analytics/CampaignTrackingReceiver;->zzKd:Ljava/lang/Boolean;

    goto :goto_d
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    invoke-static {p1}, Lcom/google/android/gms/analytics/internal/zzf;->zzX(Landroid/content/Context;)Lcom/google/android/gms/analytics/internal/zzf;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzie()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v1

    const-string v2, "referrer"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    const-string v4, "CampaignTrackingReceiver received"

    invoke-virtual {v1, v4, v3}, Lcom/google/android/gms/analytics/internal/zzaf;->zza(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v4, "com.android.vending.INSTALL_REFERRER"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_25

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2b

    :cond_25
    const-string v0, "CampaignTrackingReceiver received unexpected intent without referrer extra"

    invoke-virtual {v1, v0}, Lcom/google/android/gms/analytics/internal/zzaf;->zzbb(Ljava/lang/String;)V

    :goto_2a
    return-void

    :cond_2b
    invoke-static {p1}, Lcom/google/android/gms/analytics/CampaignTrackingService;->zzW(Landroid/content/Context;)Z

    move-result v3

    if-nez v3, :cond_36

    const-string v4, "CampaignTrackingService not registered or disabled. Installation tracking not possible. See http://goo.gl/8Rd3yj for instructions."

    invoke-virtual {v1, v4}, Lcom/google/android/gms/analytics/internal/zzaf;->zzbb(Ljava/lang/String;)V

    :cond_36
    invoke-virtual {p0, v2}, Lcom/google/android/gms/analytics/CampaignTrackingReceiver;->zzaQ(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjk()Z

    move-result v0

    if-eqz v0, :cond_49

    const-string v0, "Received unexpected installation campaign on package side"

    invoke-virtual {v1, v0}, Lcom/google/android/gms/analytics/internal/zzaf;->zzbc(Ljava/lang/String;)V

    goto :goto_2a

    :cond_49
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/CampaignTrackingReceiver;->zzht()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Landroid/content/Intent;

    invoke-direct {v4, p1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v0, "referrer"

    invoke-virtual {v4, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    sget-object v2, Lcom/google/android/gms/analytics/CampaignTrackingReceiver;->zzpm:Ljava/lang/Object;

    monitor-enter v2

    :try_start_5d
    invoke-virtual {p1, v4}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    if-nez v3, :cond_67

    monitor-exit v2

    goto :goto_2a

    :catchall_64
    move-exception v0

    monitor-exit v2
    :try_end_66
    .catchall {:try_start_5d .. :try_end_66} :catchall_64

    throw v0

    :cond_67
    :try_start_67
    sget-object v0, Lcom/google/android/gms/analytics/CampaignTrackingReceiver;->zzKc:Lcom/google/android/gms/internal/zzqd;

    if-nez v0, :cond_7b

    new-instance v0, Lcom/google/android/gms/internal/zzqd;

    const/4 v3, 0x1

    const-string v4, "Analytics campaign WakeLock"

    invoke-direct {v0, p1, v3, v4}, Lcom/google/android/gms/internal/zzqd;-><init>(Landroid/content/Context;ILjava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/analytics/CampaignTrackingReceiver;->zzKc:Lcom/google/android/gms/internal/zzqd;

    sget-object v0, Lcom/google/android/gms/analytics/CampaignTrackingReceiver;->zzKc:Lcom/google/android/gms/internal/zzqd;

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lcom/google/android/gms/internal/zzqd;->setReferenceCounted(Z)V

    :cond_7b
    sget-object v0, Lcom/google/android/gms/analytics/CampaignTrackingReceiver;->zzKc:Lcom/google/android/gms/internal/zzqd;

    const-wide/16 v4, 0x3e8

    invoke-virtual {v0, v4, v5}, Lcom/google/android/gms/internal/zzqd;->acquire(J)V
    :try_end_82
    .catch Ljava/lang/SecurityException; {:try_start_67 .. :try_end_82} :catch_84
    .catchall {:try_start_67 .. :try_end_82} :catchall_64

    :goto_82
    :try_start_82
    monitor-exit v2

    goto :goto_2a

    :catch_84
    move-exception v0

    const-string v0, "CampaignTrackingService service at risk of not starting. For more reliable installation campaign reports, add the WAKE_LOCK permission to your manifest. See http://goo.gl/8Rd3yj for instructions."

    invoke-virtual {v1, v0}, Lcom/google/android/gms/analytics/internal/zzaf;->zzbb(Ljava/lang/String;)V
    :try_end_8a
    .catchall {:try_start_82 .. :try_end_8a} :catchall_64

    goto :goto_82
.end method

.method protected zzaQ(Ljava/lang/String;)V
    .registers 2

    return-void
.end method

.method protected zzht()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<+",
            "Lcom/google/android/gms/analytics/CampaignTrackingService;",
            ">;"
        }
    .end annotation

    const-class v0, Lcom/google/android/gms/analytics/CampaignTrackingService;

    return-object v0
.end method
