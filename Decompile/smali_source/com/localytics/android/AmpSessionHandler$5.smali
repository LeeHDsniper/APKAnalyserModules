.class Lcom/localytics/android/AmpSessionHandler$5;
.super Lcom/localytics/android/AmpCallable;
.source "AmpSessionHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/AmpSessionHandler;->showAmpTest()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/AmpSessionHandler;

.field final synthetic val$adapter:Lcom/localytics/android/AmpRulesAdapter;


# direct methods
.method constructor <init>(Lcom/localytics/android/AmpSessionHandler;Lcom/localytics/android/AmpRulesAdapter;)V
    .registers 3

    .prologue
    .line 377
    iput-object p1, p0, Lcom/localytics/android/AmpSessionHandler$5;->this$0:Lcom/localytics/android/AmpSessionHandler;

    iput-object p2, p0, Lcom/localytics/android/AmpSessionHandler$5;->val$adapter:Lcom/localytics/android/AmpRulesAdapter;

    invoke-direct {p0}, Lcom/localytics/android/AmpCallable;-><init>()V

    return-void
.end method


# virtual methods
.method call([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    const/4 v10, 0x3

    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 381
    iget-object v0, p0, Lcom/localytics/android/AmpSessionHandler$5;->this$0:Lcom/localytics/android/AmpSessionHandler;

    iget-object v1, p0, Lcom/localytics/android/AmpSessionHandler$5;->this$0:Lcom/localytics/android/AmpSessionHandler;

    new-array v2, v10, [Ljava/lang/Object;

    const-string v3, "%s:%s"

    new-array v4, v9, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/localytics/android/AmpSessionHandler$5;->this$0:Lcom/localytics/android/AmpSessionHandler;

    iget-object v5, v5, Lcom/localytics/android/AmpSessionHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v7

    const-string v5, "Test Mode Update Data"

    aput-object v5, v4, v8

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v7

    aput-object v6, v2, v8

    aput-object v6, v2, v9

    invoke-virtual {v1, v10, v2}, Lcom/localytics/android/AmpSessionHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/localytics/android/AmpSessionHandler;->sendMessage(Landroid/os/Message;)Z

    .line 382
    iget-object v0, p0, Lcom/localytics/android/AmpSessionHandler$5;->this$0:Lcom/localytics/android/AmpSessionHandler;

    iget-object v1, p0, Lcom/localytics/android/AmpSessionHandler$5;->this$0:Lcom/localytics/android/AmpSessionHandler;

    const/4 v2, 0x4

    new-instance v3, Lcom/localytics/android/AmpSessionHandler$5$1;

    invoke-direct {v3, p0}, Lcom/localytics/android/AmpSessionHandler$5$1;-><init>(Lcom/localytics/android/AmpSessionHandler$5;)V

    invoke-virtual {v1, v2, v3}, Lcom/localytics/android/AmpSessionHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/localytics/android/AmpSessionHandler;->sendMessage(Landroid/os/Message;)Z

    .line 397
    return-object v6
.end method
