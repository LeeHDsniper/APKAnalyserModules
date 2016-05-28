.class public Lcom/facebook/FacebookBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "FacebookBroadcastReceiver.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 17
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method protected onFailedAppCall(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V
    .registers 4
    .param p1, "appCallId"    # Ljava/lang/String;
    .param p2, "action"    # Ljava/lang/String;
    .param p3, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 40
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 21
    const-string v3, "com.facebook.platform.protocol.CALL_ID"

    invoke-virtual {p2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 22
    .local v1, "appCallId":Ljava/lang/String;
    const-string v3, "com.facebook.platform.protocol.PROTOCOL_ACTION"

    invoke-virtual {p2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 23
    .local v0, "action":Ljava/lang/String;
    if-eqz v1, :cond_1d

    if-eqz v0, :cond_1d

    .line 24
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    .line 26
    .local v2, "extras":Landroid/os/Bundle;
    invoke-static {p2}, Lcom/facebook/internal/NativeProtocol;->isErrorResult(Landroid/content/Intent;)Z

    move-result v3

    if-eqz v3, :cond_1e

    .line 27
    invoke-virtual {p0, v1, v0, v2}, Lcom/facebook/FacebookBroadcastReceiver;->onFailedAppCall(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 32
    .end local v2    # "extras":Landroid/os/Bundle;
    :cond_1d
    :goto_1d
    return-void

    .line 29
    .restart local v2    # "extras":Landroid/os/Bundle;
    :cond_1e
    invoke-virtual {p0, v1, v0, v2}, Lcom/facebook/FacebookBroadcastReceiver;->onSuccessfulAppCall(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    goto :goto_1d
.end method

.method protected onSuccessfulAppCall(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V
    .registers 4
    .param p1, "appCallId"    # Ljava/lang/String;
    .param p2, "action"    # Ljava/lang/String;
    .param p3, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 36
    return-void
.end method
