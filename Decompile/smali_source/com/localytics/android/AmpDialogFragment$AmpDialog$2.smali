.class Lcom/localytics/android/AmpDialogFragment$AmpDialog$2;
.super Ljava/lang/Object;
.source "AmpDialogFragment.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/AmpDialogFragment$AmpDialog;->createAnimations()V
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
    .line 757
    iput-object p1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$2;->this$1:Lcom/localytics/android/AmpDialogFragment$AmpDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .registers 3
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 758
    iget-object v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$2;->this$1:Lcom/localytics/android/AmpDialogFragment$AmpDialog;

    iget-object v0, v0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->this$0:Lcom/localytics/android/AmpDialogFragment;

    invoke-virtual {v0}, Lcom/localytics/android/AmpDialogFragment;->dismiss()V

    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 760
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 762
    return-void
.end method
