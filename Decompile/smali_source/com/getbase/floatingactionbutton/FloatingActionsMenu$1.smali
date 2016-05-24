.class Lcom/getbase/floatingactionbutton/FloatingActionsMenu$1;
.super Lcom/getbase/floatingactionbutton/AddFloatingActionButton;
.source "FloatingActionsMenu.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->createAddButton(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getbase/floatingactionbutton/FloatingActionsMenu;


# direct methods
.method constructor <init>(Lcom/getbase/floatingactionbutton/FloatingActionsMenu;Landroid/content/Context;)V
    .registers 3
    .param p1, "this$0"    # Lcom/getbase/floatingactionbutton/FloatingActionsMenu;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 146
    iput-object p1, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$1;->this$0:Lcom/getbase/floatingactionbutton/FloatingActionsMenu;

    invoke-direct {p0, p2}, Lcom/getbase/floatingactionbutton/AddFloatingActionButton;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method getIconDrawable()Landroid/graphics/drawable/Drawable;
    .registers 8

    .prologue
    const/4 v6, 0x2

    .line 158
    new-instance v3, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$RotatingDrawable;

    invoke-super {p0}, Lcom/getbase/floatingactionbutton/AddFloatingActionButton;->getIconDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$RotatingDrawable;-><init>(Landroid/graphics/drawable/Drawable;)V

    .line 159
    .local v3, "rotatingDrawable":Lcom/getbase/floatingactionbutton/FloatingActionsMenu$RotatingDrawable;
    iget-object v4, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$1;->this$0:Lcom/getbase/floatingactionbutton/FloatingActionsMenu;

    # setter for: Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mRotatingDrawable:Lcom/getbase/floatingactionbutton/FloatingActionsMenu$RotatingDrawable;
    invoke-static {v4, v3}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->access$402(Lcom/getbase/floatingactionbutton/FloatingActionsMenu;Lcom/getbase/floatingactionbutton/FloatingActionsMenu$RotatingDrawable;)Lcom/getbase/floatingactionbutton/FloatingActionsMenu$RotatingDrawable;

    .line 161
    new-instance v2, Landroid/view/animation/OvershootInterpolator;

    invoke-direct {v2}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    .line 163
    .local v2, "interpolator":Landroid/view/animation/OvershootInterpolator;
    const-string v4, "rotation"

    new-array v5, v6, [F

    fill-array-data v5, :array_44

    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 164
    .local v0, "collapseAnimator":Landroid/animation/ObjectAnimator;
    const-string v4, "rotation"

    new-array v5, v6, [F

    fill-array-data v5, :array_4c

    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v1

    .line 166
    .local v1, "expandAnimator":Landroid/animation/ObjectAnimator;
    invoke-virtual {v0, v2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 167
    invoke-virtual {v1, v2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 169
    iget-object v4, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$1;->this$0:Lcom/getbase/floatingactionbutton/FloatingActionsMenu;

    # getter for: Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mExpandAnimation:Landroid/animation/AnimatorSet;
    invoke-static {v4}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->access$500(Lcom/getbase/floatingactionbutton/FloatingActionsMenu;)Landroid/animation/AnimatorSet;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 170
    iget-object v4, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$1;->this$0:Lcom/getbase/floatingactionbutton/FloatingActionsMenu;

    # getter for: Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mCollapseAnimation:Landroid/animation/AnimatorSet;
    invoke-static {v4}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->access$600(Lcom/getbase/floatingactionbutton/FloatingActionsMenu;)Landroid/animation/AnimatorSet;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 172
    return-object v3

    .line 163
    nop

    :array_44
    .array-data 4
        0x43070000
        0x0
    .end array-data

    .line 164
    :array_4c
    .array-data 4
        0x0
        0x43070000
    .end array-data
.end method

.method updateBackground()V
    .registers 2

    .prologue
    .line 149
    iget-object v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$1;->this$0:Lcom/getbase/floatingactionbutton/FloatingActionsMenu;

    # getter for: Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButtonPlusColor:I
    invoke-static {v0}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->access$000(Lcom/getbase/floatingactionbutton/FloatingActionsMenu;)I

    move-result v0

    iput v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$1;->mPlusColor:I

    .line 150
    iget-object v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$1;->this$0:Lcom/getbase/floatingactionbutton/FloatingActionsMenu;

    # getter for: Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButtonColorNormal:I
    invoke-static {v0}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->access$100(Lcom/getbase/floatingactionbutton/FloatingActionsMenu;)I

    move-result v0

    iput v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$1;->mColorNormal:I

    .line 151
    iget-object v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$1;->this$0:Lcom/getbase/floatingactionbutton/FloatingActionsMenu;

    # getter for: Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButtonColorPressed:I
    invoke-static {v0}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->access$200(Lcom/getbase/floatingactionbutton/FloatingActionsMenu;)I

    move-result v0

    iput v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$1;->mColorPressed:I

    .line 152
    iget-object v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$1;->this$0:Lcom/getbase/floatingactionbutton/FloatingActionsMenu;

    # getter for: Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->mAddButtonStrokeVisible:Z
    invoke-static {v0}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->access$300(Lcom/getbase/floatingactionbutton/FloatingActionsMenu;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$1;->mStrokeVisible:Z

    .line 153
    invoke-super {p0}, Lcom/getbase/floatingactionbutton/AddFloatingActionButton;->updateBackground()V

    .line 154
    return-void
.end method
