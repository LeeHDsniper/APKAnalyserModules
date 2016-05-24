.class public Lcom/behance/sdk/google/listview/SectionalListView;
.super Landroid/widget/ListView;
.source "SectionalListView.java"

# interfaces
.implements Lcom/behance/sdk/google/listview/SectionalBaseAdapter$HasMorePagesListener;


# static fields
.field public static final TAG:Ljava/lang/String;


# instance fields
.field private adapter:Lcom/behance/sdk/google/listview/SectionalBaseAdapter;

.field footerViewAttached:Z

.field listFooter:Landroid/view/View;

.field private mHeaderView:Landroid/view/View;

.field private mHeaderViewHeight:I

.field private mHeaderViewVisible:Z

.field private mHeaderViewWidth:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 20
    const-class v0, Lcom/behance/sdk/google/listview/SectionalListView;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/google/listview/SectionalListView;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 120
    invoke-direct {p0, p1}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    .line 23
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/behance/sdk/google/listview/SectionalListView;->footerViewAttached:Z

    .line 121
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 124
    invoke-direct {p0, p1, p2}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 23
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/behance/sdk/google/listview/SectionalListView;->footerViewAttached:Z

    .line 125
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 128
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 23
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/behance/sdk/google/listview/SectionalListView;->footerViewAttached:Z

    .line 129
    return-void
.end method


# virtual methods
.method public configureHeaderView(I)V
    .registers 13
    .param p1, "position"    # I

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 65
    iget-object v6, p0, Lcom/behance/sdk/google/listview/SectionalListView;->mHeaderView:Landroid/view/View;

    if-nez v6, :cond_7

    .line 108
    :cond_6
    :goto_6
    return-void

    .line 69
    :cond_7
    iget-object v6, p0, Lcom/behance/sdk/google/listview/SectionalListView;->adapter:Lcom/behance/sdk/google/listview/SectionalBaseAdapter;

    invoke-virtual {v6, p1}, Lcom/behance/sdk/google/listview/SectionalBaseAdapter;->getPinnedHeaderState(I)I

    move-result v4

    .line 70
    .local v4, "state":I
    packed-switch v4, :pswitch_data_6c

    goto :goto_6

    .line 72
    :pswitch_11
    iput-boolean v9, p0, Lcom/behance/sdk/google/listview/SectionalListView;->mHeaderViewVisible:Z

    goto :goto_6

    .line 77
    :pswitch_14
    iget-object v6, p0, Lcom/behance/sdk/google/listview/SectionalListView;->adapter:Lcom/behance/sdk/google/listview/SectionalBaseAdapter;

    iget-object v7, p0, Lcom/behance/sdk/google/listview/SectionalListView;->mHeaderView:Landroid/view/View;

    const/16 v8, 0xff

    invoke-virtual {v6, v7, p1, v8}, Lcom/behance/sdk/google/listview/SectionalBaseAdapter;->configurePinnedHeader(Landroid/view/View;II)V

    .line 78
    iget-object v6, p0, Lcom/behance/sdk/google/listview/SectionalListView;->mHeaderView:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getTop()I

    move-result v6

    if-eqz v6, :cond_2e

    .line 79
    iget-object v6, p0, Lcom/behance/sdk/google/listview/SectionalListView;->mHeaderView:Landroid/view/View;

    iget v7, p0, Lcom/behance/sdk/google/listview/SectionalListView;->mHeaderViewWidth:I

    iget v8, p0, Lcom/behance/sdk/google/listview/SectionalListView;->mHeaderViewHeight:I

    invoke-virtual {v6, v9, v9, v7, v8}, Landroid/view/View;->layout(IIII)V

    .line 81
    :cond_2e
    iput-boolean v10, p0, Lcom/behance/sdk/google/listview/SectionalListView;->mHeaderViewVisible:Z

    goto :goto_6

    .line 86
    :pswitch_31
    invoke-virtual {p0, v9}, Lcom/behance/sdk/google/listview/SectionalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 87
    .local v2, "firstView":Landroid/view/View;
    if-eqz v2, :cond_6

    .line 88
    invoke-virtual {v2}, Landroid/view/View;->getBottom()I

    move-result v1

    .line 89
    .local v1, "bottom":I
    iget-object v6, p0, Lcom/behance/sdk/google/listview/SectionalListView;->mHeaderView:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getHeight()I

    move-result v3

    .line 92
    .local v3, "headerHeight":I
    if-ge v1, v3, :cond_67

    .line 93
    sub-int v5, v1, v3

    .line 94
    .local v5, "y":I
    add-int v6, v3, v5

    mul-int/lit16 v6, v6, 0xff

    div-int v0, v6, v3

    .line 99
    .local v0, "alpha":I
    :goto_4b
    iget-object v6, p0, Lcom/behance/sdk/google/listview/SectionalListView;->adapter:Lcom/behance/sdk/google/listview/SectionalBaseAdapter;

    iget-object v7, p0, Lcom/behance/sdk/google/listview/SectionalListView;->mHeaderView:Landroid/view/View;

    invoke-virtual {v6, v7, p1, v0}, Lcom/behance/sdk/google/listview/SectionalBaseAdapter;->configurePinnedHeader(Landroid/view/View;II)V

    .line 100
    iget-object v6, p0, Lcom/behance/sdk/google/listview/SectionalListView;->mHeaderView:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getTop()I

    move-result v6

    if-eq v6, v5, :cond_64

    .line 101
    iget-object v6, p0, Lcom/behance/sdk/google/listview/SectionalListView;->mHeaderView:Landroid/view/View;

    iget v7, p0, Lcom/behance/sdk/google/listview/SectionalListView;->mHeaderViewWidth:I

    iget v8, p0, Lcom/behance/sdk/google/listview/SectionalListView;->mHeaderViewHeight:I

    add-int/2addr v8, v5

    invoke-virtual {v6, v9, v5, v7, v8}, Landroid/view/View;->layout(IIII)V

    .line 103
    :cond_64
    iput-boolean v10, p0, Lcom/behance/sdk/google/listview/SectionalListView;->mHeaderViewVisible:Z

    goto :goto_6

    .line 96
    .end local v0    # "alpha":I
    .end local v5    # "y":I
    :cond_67
    const/4 v5, 0x0

    .line 97
    .restart local v5    # "y":I
    const/16 v0, 0xff

    .restart local v0    # "alpha":I
    goto :goto_4b

    .line 70
    nop

    :pswitch_data_6c
    .packed-switch 0x0
        :pswitch_11
        :pswitch_14
        :pswitch_31
    .end packed-switch
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 112
    invoke-super {p0, p1}, Landroid/widget/ListView;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 113
    iget-boolean v0, p0, Lcom/behance/sdk/google/listview/SectionalListView;->mHeaderViewVisible:Z

    if-eqz v0, :cond_10

    .line 114
    iget-object v0, p0, Lcom/behance/sdk/google/listview/SectionalListView;->mHeaderView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/behance/sdk/google/listview/SectionalListView;->getDrawingTime()J

    move-result-wide v2

    invoke-virtual {p0, p1, v0, v2, v3}, Lcom/behance/sdk/google/listview/SectionalListView;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    .line 116
    :cond_10
    return-void
.end method

.method public bridge synthetic getAdapter()Landroid/widget/Adapter;
    .registers 2

    .prologue
    .line 19
    invoke-virtual {p0}, Lcom/behance/sdk/google/listview/SectionalListView;->getAdapter()Lcom/behance/sdk/google/listview/SectionalBaseAdapter;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getAdapter()Landroid/widget/ListAdapter;
    .registers 2

    .prologue
    .line 19
    invoke-virtual {p0}, Lcom/behance/sdk/google/listview/SectionalListView;->getAdapter()Lcom/behance/sdk/google/listview/SectionalBaseAdapter;

    move-result-object v0

    return-object v0
.end method

.method public getAdapter()Lcom/behance/sdk/google/listview/SectionalBaseAdapter;
    .registers 2

    .prologue
    .line 163
    iget-object v0, p0, Lcom/behance/sdk/google/listview/SectionalListView;->adapter:Lcom/behance/sdk/google/listview/SectionalBaseAdapter;

    return-object v0
.end method

.method public getLoadingView()Landroid/view/View;
    .registers 2

    .prologue
    .line 136
    iget-object v0, p0, Lcom/behance/sdk/google/listview/SectionalListView;->listFooter:Landroid/view/View;

    return-object v0
.end method

.method protected onLayout(ZIIII)V
    .registers 10
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    const/4 v3, 0x0

    .line 57
    invoke-super/range {p0 .. p5}, Landroid/widget/ListView;->onLayout(ZIIII)V

    .line 58
    iget-object v0, p0, Lcom/behance/sdk/google/listview/SectionalListView;->mHeaderView:Landroid/view/View;

    if-eqz v0, :cond_18

    .line 59
    iget-object v0, p0, Lcom/behance/sdk/google/listview/SectionalListView;->mHeaderView:Landroid/view/View;

    iget v1, p0, Lcom/behance/sdk/google/listview/SectionalListView;->mHeaderViewWidth:I

    iget v2, p0, Lcom/behance/sdk/google/listview/SectionalListView;->mHeaderViewHeight:I

    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/view/View;->layout(IIII)V

    .line 60
    invoke-virtual {p0}, Lcom/behance/sdk/google/listview/SectionalListView;->getFirstVisiblePosition()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/behance/sdk/google/listview/SectionalListView;->configureHeaderView(I)V

    .line 62
    :cond_18
    return-void
.end method

.method protected onMeasure(II)V
    .registers 4
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 47
    invoke-super {p0, p1, p2}, Landroid/widget/ListView;->onMeasure(II)V

    .line 48
    iget-object v0, p0, Lcom/behance/sdk/google/listview/SectionalListView;->mHeaderView:Landroid/view/View;

    if-eqz v0, :cond_1a

    .line 49
    iget-object v0, p0, Lcom/behance/sdk/google/listview/SectionalListView;->mHeaderView:Landroid/view/View;

    invoke-virtual {p0, v0, p1, p2}, Lcom/behance/sdk/google/listview/SectionalListView;->measureChild(Landroid/view/View;II)V

    .line 50
    invoke-virtual {p0}, Lcom/behance/sdk/google/listview/SectionalListView;->getMeasuredWidth()I

    move-result v0

    iput v0, p0, Lcom/behance/sdk/google/listview/SectionalListView;->mHeaderViewWidth:I

    .line 51
    iget-object v0, p0, Lcom/behance/sdk/google/listview/SectionalListView;->mHeaderView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    iput v0, p0, Lcom/behance/sdk/google/listview/SectionalListView;->mHeaderViewHeight:I

    .line 53
    :cond_1a
    return-void
.end method

.method public bridge synthetic setAdapter(Landroid/widget/Adapter;)V
    .registers 2

    .prologue
    .line 19
    check-cast p1, Landroid/widget/ListAdapter;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/google/listview/SectionalListView;->setAdapter(Landroid/widget/ListAdapter;)V

    return-void
.end method

.method public setAdapter(Landroid/widget/ListAdapter;)V
    .registers 6
    .param p1, "adapter"    # Landroid/widget/ListAdapter;

    .prologue
    const/4 v2, 0x0

    .line 141
    instance-of v1, p1, Lcom/behance/sdk/google/listview/SectionalBaseAdapter;

    if-nez v1, :cond_2e

    .line 142
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-class v3, Lcom/behance/sdk/google/listview/SectionalListView;

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " must use adapter of type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-class v3, Lcom/behance/sdk/google/listview/SectionalBaseAdapter;

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 146
    :cond_2e
    iget-object v1, p0, Lcom/behance/sdk/google/listview/SectionalListView;->adapter:Lcom/behance/sdk/google/listview/SectionalBaseAdapter;

    if-eqz v1, :cond_3a

    .line 147
    iget-object v1, p0, Lcom/behance/sdk/google/listview/SectionalListView;->adapter:Lcom/behance/sdk/google/listview/SectionalBaseAdapter;

    invoke-virtual {v1, v2}, Lcom/behance/sdk/google/listview/SectionalBaseAdapter;->setHasMorePagesListener(Lcom/behance/sdk/google/listview/SectionalBaseAdapter$HasMorePagesListener;)V

    .line 148
    invoke-virtual {p0, v2}, Lcom/behance/sdk/google/listview/SectionalListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    :cond_3a
    move-object v1, p1

    .line 151
    check-cast v1, Lcom/behance/sdk/google/listview/SectionalBaseAdapter;

    iput-object v1, p0, Lcom/behance/sdk/google/listview/SectionalListView;->adapter:Lcom/behance/sdk/google/listview/SectionalBaseAdapter;

    move-object v1, p1

    .line 152
    check-cast v1, Lcom/behance/sdk/google/listview/SectionalBaseAdapter;

    invoke-virtual {v1, p0}, Lcom/behance/sdk/google/listview/SectionalBaseAdapter;->setHasMorePagesListener(Lcom/behance/sdk/google/listview/SectionalBaseAdapter$HasMorePagesListener;)V

    move-object v1, p1

    .line 153
    check-cast v1, Lcom/behance/sdk/google/listview/SectionalBaseAdapter;

    invoke-virtual {p0, v1}, Lcom/behance/sdk/google/listview/SectionalListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 155
    new-instance v0, Landroid/view/View;

    invoke-virtual {p0}, Lcom/behance/sdk/google/listview/SectionalListView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 156
    .local v0, "dummy":Landroid/view/View;
    invoke-super {p0, v0}, Landroid/widget/ListView;->addFooterView(Landroid/view/View;)V

    .line 157
    invoke-super {p0, p1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 158
    invoke-super {p0, v0}, Landroid/widget/ListView;->removeFooterView(Landroid/view/View;)Z

    .line 159
    return-void
.end method

.method public setLoadingView(Landroid/view/View;)V
    .registers 2
    .param p1, "listFooter"    # Landroid/view/View;

    .prologue
    .line 132
    iput-object p1, p0, Lcom/behance/sdk/google/listview/SectionalListView;->listFooter:Landroid/view/View;

    .line 133
    return-void
.end method

.method public setPinnedHeaderView(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 34
    iput-object p1, p0, Lcom/behance/sdk/google/listview/SectionalListView;->mHeaderView:Landroid/view/View;

    .line 39
    iget-object v0, p0, Lcom/behance/sdk/google/listview/SectionalListView;->mHeaderView:Landroid/view/View;

    if-eqz v0, :cond_a

    .line 40
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/behance/sdk/google/listview/SectionalListView;->setFadingEdgeLength(I)V

    .line 42
    :cond_a
    invoke-virtual {p0}, Lcom/behance/sdk/google/listview/SectionalListView;->requestLayout()V

    .line 43
    return-void
.end method
