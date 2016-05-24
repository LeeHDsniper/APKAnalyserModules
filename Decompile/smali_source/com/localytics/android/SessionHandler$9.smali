.class Lcom/localytics/android/SessionHandler$9;
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

.field final synthetic val$pushRegId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/localytics/android/SessionHandler;Ljava/lang/String;)V
    .registers 3

    .prologue
    .line 709
    iput-object p1, p0, Lcom/localytics/android/SessionHandler$9;->this$0:Lcom/localytics/android/SessionHandler;

    iput-object p2, p0, Lcom/localytics/android/SessionHandler$9;->val$pushRegId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 712
    iget-object v0, p0, Lcom/localytics/android/SessionHandler$9;->this$0:Lcom/localytics/android/SessionHandler;

    iget-object v1, p0, Lcom/localytics/android/SessionHandler$9;->val$pushRegId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/localytics/android/SessionHandler;->setPushRegistrationId(Ljava/lang/String;)V

    .line 713
    return-void
.end method
