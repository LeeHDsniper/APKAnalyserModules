.class Lcom/localytics/android/SessionHandler$6;
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

.field final synthetic val$key:Ljava/lang/String;

.field final synthetic val$value:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/localytics/android/SessionHandler;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .prologue
    .line 597
    iput-object p1, p0, Lcom/localytics/android/SessionHandler$6;->this$0:Lcom/localytics/android/SessionHandler;

    iput-object p2, p0, Lcom/localytics/android/SessionHandler$6;->val$key:Ljava/lang/String;

    iput-object p3, p0, Lcom/localytics/android/SessionHandler$6;->val$value:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 600
    iget-object v0, p0, Lcom/localytics/android/SessionHandler$6;->this$0:Lcom/localytics/android/SessionHandler;

    iget-object v1, p0, Lcom/localytics/android/SessionHandler$6;->val$key:Ljava/lang/String;

    iget-object v2, p0, Lcom/localytics/android/SessionHandler$6;->val$value:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/localytics/android/SessionHandler;->setIdentifier(Ljava/lang/String;Ljava/lang/String;)V

    .line 601
    return-void
.end method
