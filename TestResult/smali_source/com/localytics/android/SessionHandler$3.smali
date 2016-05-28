.class Lcom/localytics/android/SessionHandler$3;
.super Ljava/lang/Object;
.source "SessionHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/SessionHandler;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/SessionHandler;

.field final synthetic val$msg:Landroid/os/Message;


# direct methods
.method constructor <init>(Lcom/localytics/android/SessionHandler;Landroid/os/Message;)V
    .registers 3

    .prologue
    .line 457
    iput-object p1, p0, Lcom/localytics/android/SessionHandler$3;->this$0:Lcom/localytics/android/SessionHandler;

    iput-object p2, p0, Lcom/localytics/android/SessionHandler$3;->val$msg:Landroid/os/Message;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 461
    iget-object v1, p0, Lcom/localytics/android/SessionHandler$3;->this$0:Lcom/localytics/android/SessionHandler;

    iget-object v0, p0, Lcom/localytics/android/SessionHandler$3;->val$msg:Landroid/os/Message;

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/util/Map;

    invoke-virtual {v1, v0}, Lcom/localytics/android/SessionHandler;->close(Ljava/util/Map;)V

    .line 462
    return-void
.end method
