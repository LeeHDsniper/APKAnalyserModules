.class Lcom/localytics/android/TestModeButton$TestModeDialog$2;
.super Ljava/lang/Object;
.source "TestModeButton.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/TestModeButton$TestModeDialog;->createAnimations()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/localytics/android/TestModeButton$TestModeDialog;


# direct methods
.method constructor <init>(Lcom/localytics/android/TestModeButton$TestModeDialog;)V
    .registers 2

    .prologue
    .line 357
    iput-object p1, p0, Lcom/localytics/android/TestModeButton$TestModeDialog$2;->this$1:Lcom/localytics/android/TestModeButton$TestModeDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .registers 3
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 358
    iget-object v0, p0, Lcom/localytics/android/TestModeButton$TestModeDialog$2;->this$1:Lcom/localytics/android/TestModeButton$TestModeDialog;

    iget-object v0, v0, Lcom/localytics/android/TestModeButton$TestModeDialog;->this$0:Lcom/localytics/android/TestModeButton;

    invoke-virtual {v0}, Lcom/localytics/android/TestModeButton;->dismiss()V

    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 360
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 362
    return-void
.end method
