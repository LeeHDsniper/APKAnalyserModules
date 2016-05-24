.class public Lcom/localytics/android/ReferralReceiver;
.super Landroid/content/BroadcastReceiver;
.source "ReferralReceiver.java"


# instance fields
.field protected appKey:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 29
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 31
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/localytics/android/ReferralReceiver;->appKey:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 39
    :try_start_0
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    .line 40
    .local v1, "extras":Landroid/os/Bundle;
    if-eqz v1, :cond_a

    .line 41
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_a} :catch_17

    .line 49
    :cond_a
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    const-string v4, "com.android.vending.INSTALL_REFERRER"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_19

    .line 71
    .end local v1    # "extras":Landroid/os/Bundle;
    :cond_16
    :goto_16
    return-void

    .line 44
    :catch_17
    move-exception v0

    .line 45
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_16

    .line 54
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "extras":Landroid/os/Bundle;
    :cond_19
    iget-object v3, p0, Lcom/localytics/android/ReferralReceiver;->appKey:Ljava/lang/String;

    if-eqz v3, :cond_25

    iget-object v3, p0, Lcom/localytics/android/ReferralReceiver;->appKey:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_2b

    .line 55
    :cond_25
    invoke-static {p1}, Lcom/localytics/android/DatapointHelper;->getLocalyticsAppKeyOrNull(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/localytics/android/ReferralReceiver;->appKey:Ljava/lang/String;

    .line 59
    :cond_2b
    iget-object v3, p0, Lcom/localytics/android/ReferralReceiver;->appKey:Ljava/lang/String;

    if-eqz v3, :cond_16

    iget-object v3, p0, Lcom/localytics/android/ReferralReceiver;->appKey:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_16

    .line 64
    const-string v3, "referrer"

    invoke-virtual {p2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 65
    .local v2, "referrer":Ljava/lang/String;
    if-eqz v2, :cond_16

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_16

    .line 70
    new-instance v3, Lcom/localytics/android/LocalyticsSession;

    iget-object v4, p0, Lcom/localytics/android/ReferralReceiver;->appKey:Ljava/lang/String;

    invoke-direct {v3, p1, v4, v2}, Lcom/localytics/android/LocalyticsSession;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_16
.end method
