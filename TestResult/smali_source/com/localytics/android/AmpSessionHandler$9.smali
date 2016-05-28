.class Lcom/localytics/android/AmpSessionHandler$9;
.super Lcom/localytics/android/AmpCallable;
.source "AmpSessionHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/AmpSessionHandler;->getDialogCallbacks()Ljava/util/Map;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/AmpSessionHandler;


# direct methods
.method constructor <init>(Lcom/localytics/android/AmpSessionHandler;)V
    .registers 2

    .prologue
    .line 553
    iput-object p1, p0, Lcom/localytics/android/AmpSessionHandler$9;->this$0:Lcom/localytics/android/AmpSessionHandler;

    invoke-direct {p0}, Lcom/localytics/android/AmpCallable;-><init>()V

    return-void
.end method


# virtual methods
.method public call([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    .line 561
    iget-object v0, p0, Lcom/localytics/android/AmpSessionHandler$9;->this$0:Lcom/localytics/android/AmpSessionHandler;

    iget-object v1, p0, Lcom/localytics/android/AmpSessionHandler$9;->this$0:Lcom/localytics/android/AmpSessionHandler;

    const/16 v2, 0x13

    invoke-virtual {v1, v2, p1}, Lcom/localytics/android/AmpSessionHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/localytics/android/AmpSessionHandler;->sendMessage(Landroid/os/Message;)Z

    .line 562
    const/4 v0, 0x0

    return-object v0
.end method
