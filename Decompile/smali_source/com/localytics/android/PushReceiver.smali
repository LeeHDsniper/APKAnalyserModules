.class public Lcom/localytics/android/PushReceiver;
.super Landroid/content/BroadcastReceiver;
.source "PushReceiver.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 15
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 19
    new-instance v0, Lcom/localytics/android/LocalyticsSession;

    invoke-direct {v0, p1}, Lcom/localytics/android/LocalyticsSession;-><init>(Landroid/content/Context;)V

    .line 21
    .local v0, "session":Lcom/localytics/android/LocalyticsSession;
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.google.android.c2dm.intent.REGISTRATION"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_15

    .line 23
    invoke-virtual {v0, p2}, Lcom/localytics/android/LocalyticsSession;->handleRegistration(Landroid/content/Intent;)V

    .line 30
    :cond_14
    :goto_14
    return-void

    .line 26
    :cond_15
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.google.android.c2dm.intent.RECEIVE"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 28
    invoke-virtual {v0, p2}, Lcom/localytics/android/LocalyticsSession;->handleNotificationReceived(Landroid/content/Intent;)V

    goto :goto_14
.end method
