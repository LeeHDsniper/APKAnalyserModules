.class Lcom/localytics/android/SessionHandler$1;
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

.field final synthetic val$isOptingOut:Z


# direct methods
.method constructor <init>(Lcom/localytics/android/SessionHandler;Z)V
    .registers 3

    .prologue
    .line 422
    iput-object p1, p0, Lcom/localytics/android/SessionHandler$1;->this$0:Lcom/localytics/android/SessionHandler;

    iput-boolean p2, p0, Lcom/localytics/android/SessionHandler$1;->val$isOptingOut:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 425
    iget-object v0, p0, Lcom/localytics/android/SessionHandler$1;->this$0:Lcom/localytics/android/SessionHandler;

    iget-boolean v1, p0, Lcom/localytics/android/SessionHandler$1;->val$isOptingOut:Z

    invoke-virtual {v0, v1}, Lcom/localytics/android/SessionHandler;->optOut(Z)V

    .line 426
    return-void
.end method
