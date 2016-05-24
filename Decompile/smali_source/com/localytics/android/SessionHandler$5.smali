.class Lcom/localytics/android/SessionHandler$5;
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

.field final synthetic val$screen:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/localytics/android/SessionHandler;Ljava/lang/String;)V
    .registers 3

    .prologue
    .line 576
    iput-object p1, p0, Lcom/localytics/android/SessionHandler$5;->this$0:Lcom/localytics/android/SessionHandler;

    iput-object p2, p0, Lcom/localytics/android/SessionHandler$5;->val$screen:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 579
    iget-object v0, p0, Lcom/localytics/android/SessionHandler$5;->this$0:Lcom/localytics/android/SessionHandler;

    iget-object v1, p0, Lcom/localytics/android/SessionHandler$5;->val$screen:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/localytics/android/SessionHandler;->tagScreen(Ljava/lang/String;)V

    .line 580
    return-void
.end method
