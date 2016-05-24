.class Lcom/localytics/android/AmpDialogFragment$2;
.super Lcom/localytics/android/AmpCallable;
.source "AmpDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/AmpDialogFragment;->setJavaScriptClient(Lcom/localytics/android/JavaScriptClient;)Lcom/localytics/android/AmpDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/AmpDialogFragment;


# direct methods
.method constructor <init>(Lcom/localytics/android/AmpDialogFragment;)V
    .registers 2

    .prologue
    .line 332
    iput-object p1, p0, Lcom/localytics/android/AmpDialogFragment$2;->this$0:Lcom/localytics/android/AmpDialogFragment;

    invoke-direct {p0}, Lcom/localytics/android/AmpCallable;-><init>()V

    return-void
.end method


# virtual methods
.method call([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    .line 336
    iget-object v0, p0, Lcom/localytics/android/AmpDialogFragment$2;->this$0:Lcom/localytics/android/AmpDialogFragment;

    invoke-virtual {v0}, Lcom/localytics/android/AmpDialogFragment;->dismiss()V

    .line 337
    const/4 v0, 0x0

    return-object v0
.end method
