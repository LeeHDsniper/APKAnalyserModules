.class Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$4;
.super Landroid/content/BroadcastReceiver;
.source "MonitoredActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->initializeBroadcastReceivers()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;

    .prologue
    .line 260
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$4;->this$0:Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 263
    const-string v1, "MonitoredActivity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onReceive: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 265
    if-eqz p2, :cond_2d

    if-eqz p1, :cond_2d

    .line 267
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 269
    .local v0, "action":Ljava/lang/String;
    const-string v1, "aviary.intent.action.KILL"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2e

    .line 270
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$4;->this$0:Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;

    # invokes: Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->onKill()V
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->access$200(Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;)V

    .line 276
    .end local v0    # "action":Ljava/lang/String;
    :cond_2d
    :goto_2d
    return-void

    .line 272
    .restart local v0    # "action":Ljava/lang/String;
    :cond_2e
    const-string v1, "aviary.intent.action.ALERT"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2d

    .line 273
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$4;->this$0:Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;

    # invokes: Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->onAlertMessageReceived(Landroid/content/Intent;)V
    invoke-static {v1, p2}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->access$300(Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;Landroid/content/Intent;)V

    goto :goto_2d
.end method
