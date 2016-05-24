.class Lcom/localytics/android/AmpDialogFragment$AmpDialog$1;
.super Ljava/lang/Object;
.source "AmpDialogFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/AmpDialogFragment$AmpDialog;->setupViews()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/localytics/android/AmpDialogFragment$AmpDialog;


# direct methods
.method constructor <init>(Lcom/localytics/android/AmpDialogFragment$AmpDialog;)V
    .registers 2

    .prologue
    .line 638
    iput-object p1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$1;->this$1:Lcom/localytics/android/AmpDialogFragment$AmpDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 641
    iget-object v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$1;->this$1:Lcom/localytics/android/AmpDialogFragment$AmpDialog;

    iget-object v0, v0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->this$0:Lcom/localytics/android/AmpDialogFragment;

    # getter for: Lcom/localytics/android/AmpDialogFragment;->mExitAnimatable:Ljava/util/concurrent/atomic/AtomicBoolean;
    invoke-static {v0}, Lcom/localytics/android/AmpDialogFragment;->access$300(Lcom/localytics/android/AmpDialogFragment;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 643
    iget-object v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$1;->this$1:Lcom/localytics/android/AmpDialogFragment$AmpDialog;

    invoke-virtual {v0}, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->dismissWithAnimation()V

    .line 645
    :cond_14
    return-void
.end method
