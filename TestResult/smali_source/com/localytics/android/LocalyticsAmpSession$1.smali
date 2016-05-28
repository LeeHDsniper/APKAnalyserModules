.class Lcom/localytics/android/LocalyticsAmpSession$1;
.super Ljava/lang/Object;
.source "LocalyticsAmpSession.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/LocalyticsAmpSession;->uploadAnalytics()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/LocalyticsAmpSession;

.field final synthetic val$handler:Lcom/localytics/android/AmpSessionHandler;


# direct methods
.method constructor <init>(Lcom/localytics/android/LocalyticsAmpSession;Lcom/localytics/android/AmpSessionHandler;)V
    .registers 3

    .prologue
    .line 95
    iput-object p1, p0, Lcom/localytics/android/LocalyticsAmpSession$1;->this$0:Lcom/localytics/android/LocalyticsAmpSession;

    iput-object p2, p0, Lcom/localytics/android/LocalyticsAmpSession$1;->val$handler:Lcom/localytics/android/AmpSessionHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    .prologue
    .line 98
    iget-object v0, p0, Lcom/localytics/android/LocalyticsAmpSession$1;->val$handler:Lcom/localytics/android/AmpSessionHandler;

    iget-object v1, p0, Lcom/localytics/android/LocalyticsAmpSession$1;->val$handler:Lcom/localytics/android/AmpSessionHandler;

    const/16 v2, 0xd

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "AMP Loaded"

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const/4 v5, 0x0

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Lcom/localytics/android/AmpSessionHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/localytics/android/AmpSessionHandler;->sendMessage(Landroid/os/Message;)Z

    .line 99
    return-void
.end method
