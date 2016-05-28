.class Lcom/localytics/android/SessionHandler$8;
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

.field final synthetic val$disabled:I


# direct methods
.method constructor <init>(Lcom/localytics/android/SessionHandler;I)V
    .registers 3

    .prologue
    .line 690
    iput-object p1, p0, Lcom/localytics/android/SessionHandler$8;->this$0:Lcom/localytics/android/SessionHandler;

    iput p2, p0, Lcom/localytics/android/SessionHandler$8;->val$disabled:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 693
    iget-object v0, p0, Lcom/localytics/android/SessionHandler$8;->this$0:Lcom/localytics/android/SessionHandler;

    iget v1, p0, Lcom/localytics/android/SessionHandler$8;->val$disabled:I

    invoke-virtual {v0, v1}, Lcom/localytics/android/SessionHandler;->setPushDisabled(I)V

    .line 694
    return-void
.end method
