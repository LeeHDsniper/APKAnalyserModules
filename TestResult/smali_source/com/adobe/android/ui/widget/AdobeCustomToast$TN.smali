.class Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;
.super Ljava/lang/Object;
.source "AdobeCustomToast.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/android/ui/widget/AdobeCustomToast;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TN"
.end annotation


# instance fields
.field final mHide:Ljava/lang/Runnable;

.field mParams:Landroid/view/WindowManager$LayoutParams;

.field final mShow:Ljava/lang/Runnable;

.field mWm:Landroid/view/WindowManager;

.field final synthetic this$0:Lcom/adobe/android/ui/widget/AdobeCustomToast;


# direct methods
.method constructor <init>(Lcom/adobe/android/ui/widget/AdobeCustomToast;)V
    .registers 5

    .prologue
    const/4 v2, -0x2

    .line 118
    iput-object p1, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->this$0:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 103
    new-instance v1, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN$1;

    invoke-direct {v1, p0}, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN$1;-><init>(Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;)V

    iput-object v1, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->mShow:Ljava/lang/Runnable;

    .line 109
    new-instance v1, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN$2;

    invoke-direct {v1, p0}, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN$2;-><init>(Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;)V

    iput-object v1, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->mHide:Ljava/lang/Runnable;

    .line 115
    new-instance v1, Landroid/view/WindowManager$LayoutParams;

    invoke-direct {v1}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    iput-object v1, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->mParams:Landroid/view/WindowManager$LayoutParams;

    .line 119
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->mParams:Landroid/view/WindowManager$LayoutParams;

    .line 120
    .local v0, "params":Landroid/view/WindowManager$LayoutParams;
    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 121
    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 122
    const/16 v1, 0x98

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 124
    const/4 v1, -0x3

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->format:I

    .line 125
    const/16 v1, 0x7d5

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->type:I

    .line 126
    sget v1, Lcom/adobe/android/ui/R$style;->AdobeToast:I

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->windowAnimations:I

    .line 127
    const-string v1, "Toast"

    invoke-virtual {v0, v1}, Landroid/view/WindowManager$LayoutParams;->setTitle(Ljava/lang/CharSequence;)V

    .line 128
    return-void
.end method


# virtual methods
.method public handleHide()V
    .registers 2

    .prologue
    .line 171
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->removeView()V

    .line 172
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->this$0:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    # getter for: Lcom/adobe/android/ui/widget/AdobeCustomToast;->mLayoutListener:Lcom/adobe/android/ui/widget/AdobeCustomToast$LayoutListener;
    invoke-static {v0}, Lcom/adobe/android/ui/widget/AdobeCustomToast;->access$000(Lcom/adobe/android/ui/widget/AdobeCustomToast;)Lcom/adobe/android/ui/widget/AdobeCustomToast$LayoutListener;

    move-result-object v0

    if-eqz v0, :cond_14

    .line 173
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->this$0:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    # getter for: Lcom/adobe/android/ui/widget/AdobeCustomToast;->mLayoutListener:Lcom/adobe/android/ui/widget/AdobeCustomToast$LayoutListener;
    invoke-static {v0}, Lcom/adobe/android/ui/widget/AdobeCustomToast;->access$000(Lcom/adobe/android/ui/widget/AdobeCustomToast;)Lcom/adobe/android/ui/widget/AdobeCustomToast$LayoutListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/adobe/android/ui/widget/AdobeCustomToast$LayoutListener;->onHidden()V

    .line 175
    :cond_14
    return-void
.end method

.method public handleShow()V
    .registers 5

    .prologue
    const/high16 v3, 0x3f800000

    .line 140
    iget-object v1, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->this$0:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    iget-object v1, v1, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mView:Landroid/view/View;

    iget-object v2, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->this$0:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    iget-object v2, v2, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mNextView:Landroid/view/View;

    if-eq v1, v2, :cond_96

    .line 141
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->handleHide()V

    .line 142
    iget-object v1, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->this$0:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    iget-object v2, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->this$0:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    iget-object v2, v2, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mNextView:Landroid/view/View;

    iput-object v2, v1, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mView:Landroid/view/View;

    .line 143
    iget-object v1, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->this$0:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    iget v0, v1, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mGravity:I

    .line 144
    .local v0, "gravity":I
    iget-object v1, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->mParams:Landroid/view/WindowManager$LayoutParams;

    iput v0, v1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 145
    and-int/lit8 v1, v0, 0x7

    const/4 v2, 0x7

    if-ne v1, v2, :cond_28

    .line 146
    iget-object v1, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->mParams:Landroid/view/WindowManager$LayoutParams;

    iput v3, v1, Landroid/view/WindowManager$LayoutParams;->horizontalWeight:F

    .line 148
    :cond_28
    and-int/lit8 v1, v0, 0x70

    const/16 v2, 0x70

    if-ne v1, v2, :cond_32

    .line 149
    iget-object v1, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->mParams:Landroid/view/WindowManager$LayoutParams;

    iput v3, v1, Landroid/view/WindowManager$LayoutParams;->verticalWeight:F

    .line 151
    :cond_32
    iget-object v1, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->mParams:Landroid/view/WindowManager$LayoutParams;

    iget-object v2, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->this$0:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    iget v2, v2, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mX:I

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 152
    iget-object v1, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->mParams:Landroid/view/WindowManager$LayoutParams;

    iget-object v2, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->this$0:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    iget v2, v2, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mY:I

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 153
    iget-object v1, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->mParams:Landroid/view/WindowManager$LayoutParams;

    iget-object v2, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->this$0:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    iget v2, v2, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mVerticalMargin:F

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->verticalMargin:F

    .line 154
    iget-object v1, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->mParams:Landroid/view/WindowManager$LayoutParams;

    iget-object v2, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->this$0:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    iget v2, v2, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mHorizontalMargin:F

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->horizontalMargin:F

    .line 156
    iget-object v1, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->this$0:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    iget-object v1, v1, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-eqz v1, :cond_6e

    .line 157
    iget-object v1, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->this$0:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    iget-object v1, v1, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mView:Landroid/view/View;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 158
    iget-object v1, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->mWm:Landroid/view/WindowManager;

    iget-object v2, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->this$0:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    iget-object v2, v2, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mView:Landroid/view/View;

    invoke-interface {v1, v2}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V

    .line 161
    :cond_6e
    iget-object v1, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->mWm:Landroid/view/WindowManager;

    iget-object v2, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->this$0:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    iget-object v2, v2, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mView:Landroid/view/View;

    iget-object v3, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->mParams:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v1, v2, v3}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 162
    iget-object v1, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->this$0:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    iget-object v1, v1, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mView:Landroid/view/View;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 164
    iget-object v1, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->this$0:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    # getter for: Lcom/adobe/android/ui/widget/AdobeCustomToast;->mLayoutListener:Lcom/adobe/android/ui/widget/AdobeCustomToast$LayoutListener;
    invoke-static {v1}, Lcom/adobe/android/ui/widget/AdobeCustomToast;->access$000(Lcom/adobe/android/ui/widget/AdobeCustomToast;)Lcom/adobe/android/ui/widget/AdobeCustomToast$LayoutListener;

    move-result-object v1

    if-eqz v1, :cond_96

    .line 165
    iget-object v1, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->this$0:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    # getter for: Lcom/adobe/android/ui/widget/AdobeCustomToast;->mLayoutListener:Lcom/adobe/android/ui/widget/AdobeCustomToast$LayoutListener;
    invoke-static {v1}, Lcom/adobe/android/ui/widget/AdobeCustomToast;->access$000(Lcom/adobe/android/ui/widget/AdobeCustomToast;)Lcom/adobe/android/ui/widget/AdobeCustomToast$LayoutListener;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->this$0:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    iget-object v2, v2, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mView:Landroid/view/View;

    invoke-interface {v1, v2}, Lcom/adobe/android/ui/widget/AdobeCustomToast$LayoutListener;->onShown(Landroid/view/View;)V

    .line 168
    .end local v0    # "gravity":I
    :cond_96
    return-void
.end method

.method public hide()V
    .registers 3

    .prologue
    .line 135
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->this$0:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    iget-object v0, v0, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->mHide:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 136
    return-void
.end method

.method removeView()V
    .registers 3

    .prologue
    .line 178
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->this$0:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    iget-object v0, v0, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mView:Landroid/view/View;

    if-eqz v0, :cond_27

    .line 179
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->this$0:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    iget-object v0, v0, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_22

    .line 180
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->this$0:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    iget-object v0, v0, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 181
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->mWm:Landroid/view/WindowManager;

    iget-object v1, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->this$0:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    iget-object v1, v1, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mView:Landroid/view/View;

    invoke-interface {v0, v1}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V

    .line 183
    :cond_22
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->this$0:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mView:Landroid/view/View;

    .line 185
    :cond_27
    return-void
.end method

.method public show()V
    .registers 3

    .prologue
    .line 131
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->this$0:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    iget-object v0, v0, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->mShow:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 132
    return-void
.end method
