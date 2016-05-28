.class public Lcom/adobe/android/ui/widget/AdobeCustomToast;
.super Ljava/lang/Object;
.source "AdobeCustomToast.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;,
        Lcom/adobe/android/ui/widget/AdobeCustomToast$LayoutListener;
    }
.end annotation


# instance fields
.field mContext:Landroid/content/Context;

.field mDuration:I

.field mGravity:I

.field final mHandler:Landroid/os/Handler;

.field mHorizontalMargin:F

.field private mLayoutListener:Lcom/adobe/android/ui/widget/AdobeCustomToast$LayoutListener;

.field mNextView:Landroid/view/View;

.field final mTN:Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;

.field mVerticalMargin:F

.field mView:Landroid/view/View;

.field mWindowManager:Landroid/view/WindowManager;

.field mX:I

.field mY:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mHandler:Landroid/os/Handler;

    .line 28
    const/16 v0, 0x11

    iput v0, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mGravity:I

    .line 35
    iput-object p1, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mContext:Landroid/content/Context;

    .line 36
    const-string v0, "window"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    iput-object v0, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mWindowManager:Landroid/view/WindowManager;

    .line 38
    new-instance v0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;

    invoke-direct {v0, p0}, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;-><init>(Lcom/adobe/android/ui/widget/AdobeCustomToast;)V

    iput-object v0, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mTN:Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;

    .line 39
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mTN:Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;

    iget-object v1, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mWindowManager:Landroid/view/WindowManager;

    iput-object v1, v0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->mWm:Landroid/view/WindowManager;

    .line 40
    iput v2, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mY:I

    .line 41
    iput v2, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mX:I

    .line 42
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/android/ui/widget/AdobeCustomToast;)Lcom/adobe/android/ui/widget/AdobeCustomToast$LayoutListener;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/android/ui/widget/AdobeCustomToast;

    .prologue
    .line 19
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mLayoutListener:Lcom/adobe/android/ui/widget/AdobeCustomToast$LayoutListener;

    return-object v0
.end method

.method public static make(Landroid/content/Context;II)Lcom/adobe/android/ui/widget/AdobeCustomToast;
    .registers 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "resid"    # I
    .param p2, "duration"    # I

    .prologue
    .line 53
    new-instance v1, Lcom/adobe/android/ui/widget/AdobeCustomToast;

    invoke-direct {v1, p0}, Lcom/adobe/android/ui/widget/AdobeCustomToast;-><init>(Landroid/content/Context;)V

    .line 54
    .local v1, "result":Lcom/adobe/android/ui/widget/AdobeCustomToast;
    const-string v3, "layout_inflater"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    .line 55
    .local v0, "inflater":Landroid/view/LayoutInflater;
    const/4 v3, 0x0

    invoke-virtual {v0, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 56
    .local v2, "v":Landroid/view/View;
    iput-object v2, v1, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mNextView:Landroid/view/View;

    .line 57
    iput p2, v1, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mDuration:I

    .line 58
    return-object v1
.end method


# virtual methods
.method public hide()V
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mTN:Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;

    invoke-virtual {v0}, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->hide()V

    .line 92
    return-void
.end method

.method public show()V
    .registers 3

    .prologue
    .line 74
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mNextView:Landroid/view/View;

    if-nez v0, :cond_c

    .line 75
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "setView must be called first"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 77
    :cond_c
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast;->mTN:Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;

    invoke-virtual {v0}, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->show()V

    .line 78
    return-void
.end method
