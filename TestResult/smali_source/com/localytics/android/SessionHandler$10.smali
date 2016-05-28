.class Lcom/localytics/android/SessionHandler$10;
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

.field final synthetic val$dimension:I

.field final synthetic val$value:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/localytics/android/SessionHandler;ILjava/lang/String;)V
    .registers 4

    .prologue
    .line 741
    iput-object p1, p0, Lcom/localytics/android/SessionHandler$10;->this$0:Lcom/localytics/android/SessionHandler;

    iput p2, p0, Lcom/localytics/android/SessionHandler$10;->val$dimension:I

    iput-object p3, p0, Lcom/localytics/android/SessionHandler$10;->val$value:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 744
    iget-object v0, p0, Lcom/localytics/android/SessionHandler$10;->this$0:Lcom/localytics/android/SessionHandler;

    iget v1, p0, Lcom/localytics/android/SessionHandler$10;->val$dimension:I

    iget-object v2, p0, Lcom/localytics/android/SessionHandler$10;->val$value:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/localytics/android/SessionHandler;->setCustomDimension(ILjava/lang/String;)V

    .line 745
    return-void
.end method
