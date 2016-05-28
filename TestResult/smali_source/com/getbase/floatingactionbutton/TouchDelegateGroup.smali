.class public Lcom/getbase/floatingactionbutton/TouchDelegateGroup;
.super Landroid/view/TouchDelegate;
.source "TouchDelegateGroup.java"


# static fields
.field private static final USELESS_HACKY_RECT:Landroid/graphics/Rect;


# instance fields
.field private mCurrentTouchDelegate:Landroid/view/TouchDelegate;

.field private mEnabled:Z

.field private final mTouchDelegates:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/TouchDelegate;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 12
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Lcom/getbase/floatingactionbutton/TouchDelegateGroup;->USELESS_HACKY_RECT:Landroid/graphics/Rect;

    return-void
.end method

.method public constructor <init>(Landroid/view/View;)V
    .registers 3
    .param p1, "uselessHackyView"    # Landroid/view/View;

    .prologue
    .line 18
    sget-object v0, Lcom/getbase/floatingactionbutton/TouchDelegateGroup;->USELESS_HACKY_RECT:Landroid/graphics/Rect;

    invoke-direct {p0, v0, p1}, Landroid/view/TouchDelegate;-><init>(Landroid/graphics/Rect;Landroid/view/View;)V

    .line 13
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/getbase/floatingactionbutton/TouchDelegateGroup;->mTouchDelegates:Ljava/util/ArrayList;

    .line 19
    return-void
.end method


# virtual methods
.method public addTouchDelegate(Landroid/view/TouchDelegate;)V
    .registers 3
    .param p1, "touchDelegate"    # Landroid/view/TouchDelegate;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/getbase/floatingactionbutton/TouchDelegateGroup;->mTouchDelegates:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 23
    return-void
.end method

.method public clearTouchDelegates()V
    .registers 2

    .prologue
    .line 33
    iget-object v0, p0, Lcom/getbase/floatingactionbutton/TouchDelegateGroup;->mTouchDelegates:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 34
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getbase/floatingactionbutton/TouchDelegateGroup;->mCurrentTouchDelegate:Landroid/view/TouchDelegate;

    .line 35
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 8
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 39
    iget-boolean v5, p0, Lcom/getbase/floatingactionbutton/TouchDelegateGroup;->mEnabled:Z

    if-nez v5, :cond_8

    move v3, v4

    .line 65
    :cond_7
    :goto_7
    return v3

    .line 41
    :cond_8
    const/4 v0, 0x0

    .line 43
    .local v0, "delegate":Landroid/view/TouchDelegate;
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v5

    packed-switch v5, :pswitch_data_40

    .line 65
    :cond_10
    :goto_10
    if-eqz v0, :cond_18

    invoke-virtual {v0, p1}, Landroid/view/TouchDelegate;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v5

    if-nez v5, :cond_7

    :cond_18
    move v3, v4

    goto :goto_7

    .line 45
    :pswitch_1a
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1b
    iget-object v5, p0, Lcom/getbase/floatingactionbutton/TouchDelegateGroup;->mTouchDelegates:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v1, v5, :cond_10

    .line 46
    iget-object v5, p0, Lcom/getbase/floatingactionbutton/TouchDelegateGroup;->mTouchDelegates:Ljava/util/ArrayList;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/TouchDelegate;

    .line 47
    .local v2, "touchDelegate":Landroid/view/TouchDelegate;
    invoke-virtual {v2, p1}, Landroid/view/TouchDelegate;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v5

    if-eqz v5, :cond_34

    .line 48
    iput-object v2, p0, Lcom/getbase/floatingactionbutton/TouchDelegateGroup;->mCurrentTouchDelegate:Landroid/view/TouchDelegate;

    goto :goto_7

    .line 45
    :cond_34
    add-int/lit8 v1, v1, 0x1

    goto :goto_1b

    .line 55
    .end local v1    # "i":I
    .end local v2    # "touchDelegate":Landroid/view/TouchDelegate;
    :pswitch_37
    iget-object v0, p0, Lcom/getbase/floatingactionbutton/TouchDelegateGroup;->mCurrentTouchDelegate:Landroid/view/TouchDelegate;

    .line 56
    goto :goto_10

    .line 60
    :pswitch_3a
    iget-object v0, p0, Lcom/getbase/floatingactionbutton/TouchDelegateGroup;->mCurrentTouchDelegate:Landroid/view/TouchDelegate;

    .line 61
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/getbase/floatingactionbutton/TouchDelegateGroup;->mCurrentTouchDelegate:Landroid/view/TouchDelegate;

    goto :goto_10

    .line 43
    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_1a
        :pswitch_3a
        :pswitch_37
        :pswitch_3a
    .end packed-switch
.end method

.method public setEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 69
    iput-boolean p1, p0, Lcom/getbase/floatingactionbutton/TouchDelegateGroup;->mEnabled:Z

    .line 70
    return-void
.end method
