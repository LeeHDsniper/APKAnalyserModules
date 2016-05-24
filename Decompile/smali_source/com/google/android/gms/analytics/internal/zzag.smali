.class Lcom/google/android/gms/analytics/internal/zzag;
.super Landroid/content/BroadcastReceiver;


# static fields
.field static final zzOo:Ljava/lang/String;


# instance fields
.field private final zzLy:Lcom/google/android/gms/analytics/internal/zzf;

.field private zzOp:Z

.field private zzOq:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-class v0, Lcom/google/android/gms/analytics/internal/zzag;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/analytics/internal/zzag;->zzOo:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Lcom/google/android/gms/analytics/internal/zzf;)V
    .registers 2

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/analytics/internal/zzag;->zzLy:Lcom/google/android/gms/analytics/internal/zzf;

    return-void
.end method

.method private getContext()Landroid/content/Context;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzag;->zzLy:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->getContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method private zzhz()Lcom/google/android/gms/analytics/internal/zzb;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzag;->zzLy:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzhz()Lcom/google/android/gms/analytics/internal/zzb;

    move-result-object v0

    return-object v0
.end method

.method private zzie()Lcom/google/android/gms/analytics/internal/zzaf;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzag;->zzLy:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzie()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v0

    return-object v0
.end method

.method private zzks()V
    .registers 1

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzag;->zzie()Lcom/google/android/gms/analytics/internal/zzaf;

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzag;->zzhz()Lcom/google/android/gms/analytics/internal/zzb;

    return-void
.end method


# virtual methods
.method public isConnected()Z
    .registers 3

    iget-boolean v0, p0, Lcom/google/android/gms/analytics/internal/zzag;->zzOp:Z

    if-nez v0, :cond_f

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzag;->zzLy:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzie()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v0

    const-string v1, "Connectivity unknown. Receiver not registered"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/analytics/internal/zzaf;->zzbb(Ljava/lang/String;)V

    :cond_f
    iget-boolean v0, p0, Lcom/google/android/gms/analytics/internal/zzag;->zzOq:Z

    return v0
.end method

.method public isRegistered()Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/analytics/internal/zzag;->zzOp:Z

    return v0
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 6
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzag;->zzks()V

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzag;->zzLy:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzf;->zzie()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v1

    const-string v2, "NetworkBroadcastReceiver received action"

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/analytics/internal/zzaf;->zza(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2c

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzag;->zzku()Z

    move-result v0

    iget-boolean v1, p0, Lcom/google/android/gms/analytics/internal/zzag;->zzOq:Z

    if-eq v1, v0, :cond_2b

    iput-boolean v0, p0, Lcom/google/android/gms/analytics/internal/zzag;->zzOq:Z

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzag;->zzhz()Lcom/google/android/gms/analytics/internal/zzb;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/android/gms/analytics/internal/zzb;->zzI(Z)V

    :cond_2b
    :goto_2b
    return-void

    :cond_2c
    const-string v1, "com.google.analytics.RADIO_POWERED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_44

    sget-object v0, Lcom/google/android/gms/analytics/internal/zzag;->zzOo:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2b

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzag;->zzhz()Lcom/google/android/gms/analytics/internal/zzb;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzb;->zzhY()V

    goto :goto_2b

    :cond_44
    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzag;->zzLy:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzf;->zzie()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v1

    const-string v2, "NetworkBroadcastReceiver received unknown action"

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/analytics/internal/zzaf;->zzd(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_2b
.end method

.method public unregister()V
    .registers 4

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzag;->isRegistered()Z

    move-result v0

    if-nez v0, :cond_8

    :goto_7
    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzag;->zzLy:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzie()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v0

    const-string v1, "Unregistering connectivity change receiver"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/analytics/internal/zzaf;->zzaY(Ljava/lang/String;)V

    iput-boolean v2, p0, Lcom/google/android/gms/analytics/internal/zzag;->zzOp:Z

    iput-boolean v2, p0, Lcom/google/android/gms/analytics/internal/zzag;->zzOq:Z

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzag;->getContext()Landroid/content/Context;

    move-result-object v0

    :try_start_1b
    invoke-virtual {v0, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_1e
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1b .. :try_end_1e} :catch_1f

    goto :goto_7

    :catch_1f
    move-exception v0

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzag;->zzie()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v1

    const-string v2, "Failed to unregister the network broadcast receiver"

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/analytics/internal/zzaf;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_7
.end method

.method public zzkr()V
    .registers 4

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzag;->zzks()V

    iget-boolean v0, p0, Lcom/google/android/gms/analytics/internal/zzag;->zzOp:Z

    if-eqz v0, :cond_8

    :goto_7
    return-void

    :cond_8
    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzag;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    const-string v1, "com.google.analytics.RADIO_POWERED"

    new-instance v2, Landroid/content/IntentFilter;

    invoke-direct {v2, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/content/IntentFilter;->addCategory(Ljava/lang/String;)V

    invoke-virtual {v0, p0, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzag;->zzku()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/analytics/internal/zzag;->zzOq:Z

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzag;->zzLy:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzie()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v0

    const-string v1, "Registering connectivity change receiver. Network connected"

    iget-boolean v2, p0, Lcom/google/android/gms/analytics/internal/zzag;->zzOq:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/analytics/internal/zzaf;->zza(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/analytics/internal/zzag;->zzOp:Z

    goto :goto_7
.end method

.method public zzkt()V
    .registers 5

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xa

    if-gt v0, v1, :cond_7

    :goto_6
    return-void

    :cond_7
    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzag;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.google.analytics.RADIO_POWERED"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    sget-object v2, Lcom/google/android/gms/analytics/internal/zzag;->zzOo:Ljava/lang/String;

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->sendOrderedBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    goto :goto_6
.end method

.method protected zzku()Z
    .registers 4

    const/4 v1, 0x0

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzag;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "connectivity"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    :try_start_d
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    if-eqz v0, :cond_1b

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z
    :try_end_16
    .catch Ljava/lang/SecurityException; {:try_start_d .. :try_end_16} :catch_1d

    move-result v0

    if-eqz v0, :cond_1b

    const/4 v0, 0x1

    :goto_1a
    return v0

    :cond_1b
    move v0, v1

    goto :goto_1a

    :catch_1d
    move-exception v0

    move v0, v1

    goto :goto_1a
.end method
