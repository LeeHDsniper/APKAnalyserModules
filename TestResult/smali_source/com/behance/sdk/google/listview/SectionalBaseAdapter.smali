.class public abstract Lcom/behance/sdk/google/listview/SectionalBaseAdapter;
.super Landroid/widget/BaseAdapter;
.source "SectionalBaseAdapter.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;
.implements Landroid/widget/SectionIndexer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/behance/sdk/google/listview/SectionalBaseAdapter$HasMorePagesListener;
    }
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String;


# instance fields
.field automaticNextPageLoading:Z

.field hasMorePagesListener:Lcom/behance/sdk/google/listview/SectionalBaseAdapter$HasMorePagesListener;

.field initialPage:I

.field page:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 11
    const-class v0, Lcom/behance/sdk/google/listview/SectionalBaseAdapter;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/google/listview/SectionalBaseAdapter;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x1

    .line 10
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 21
    iput v0, p0, Lcom/behance/sdk/google/listview/SectionalBaseAdapter;->page:I

    .line 22
    iput v0, p0, Lcom/behance/sdk/google/listview/SectionalBaseAdapter;->initialPage:I

    .line 23
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/behance/sdk/google/listview/SectionalBaseAdapter;->automaticNextPageLoading:Z

    return-void
.end method


# virtual methods
.method protected abstract bindSectionHeader(Landroid/view/View;IZ)V
.end method

.method public abstract configurePinnedHeader(Landroid/view/View;II)V
.end method

.method public abstract getAmazingView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end method

.method public getPinnedHeaderState(I)I
    .registers 5
    .param p1, "position"    # I

    .prologue
    .line 53
    if-ltz p1, :cond_8

    invoke-virtual {p0}, Lcom/behance/sdk/google/listview/SectionalBaseAdapter;->getCount()I

    move-result v2

    if-nez v2, :cond_a

    .line 54
    :cond_8
    const/4 v2, 0x0

    .line 65
    :goto_9
    return v2

    .line 59
    :cond_a
    invoke-virtual {p0, p1}, Lcom/behance/sdk/google/listview/SectionalBaseAdapter;->getSectionForPosition(I)I

    move-result v1

    .line 60
    .local v1, "section":I
    add-int/lit8 v2, v1, 0x1

    invoke-virtual {p0, v2}, Lcom/behance/sdk/google/listview/SectionalBaseAdapter;->getPositionForSection(I)I

    move-result v0

    .line 61
    .local v0, "nextSectionPosition":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1d

    add-int/lit8 v2, v0, -0x1

    if-ne p1, v2, :cond_1d

    .line 62
    const/4 v2, 0x2

    goto :goto_9

    .line 65
    :cond_1d
    const/4 v2, 0x1

    goto :goto_9
.end method

.method public abstract getPositionForSection(I)I
.end method

.method public abstract getSectionForPosition(I)I
.end method

.method public final getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 8
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 105
    invoke-virtual {p0, p1, p2, p3}, Lcom/behance/sdk/google/listview/SectionalBaseAdapter;->getAmazingView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 107
    .local v1, "res":Landroid/view/View;
    invoke-virtual {p0}, Lcom/behance/sdk/google/listview/SectionalBaseAdapter;->getCount()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ne p1, v3, :cond_17

    iget-boolean v3, p0, Lcom/behance/sdk/google/listview/SectionalBaseAdapter;->automaticNextPageLoading:Z

    if-eqz v3, :cond_17

    .line 108
    iget v3, p0, Lcom/behance/sdk/google/listview/SectionalBaseAdapter;->page:I

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {p0, v3}, Lcom/behance/sdk/google/listview/SectionalBaseAdapter;->onNextPageRequested(I)V

    .line 111
    :cond_17
    invoke-virtual {p0, p1}, Lcom/behance/sdk/google/listview/SectionalBaseAdapter;->getSectionForPosition(I)I

    move-result v2

    .line 112
    .local v2, "section":I
    invoke-virtual {p0, v2}, Lcom/behance/sdk/google/listview/SectionalBaseAdapter;->getPositionForSection(I)I

    move-result v3

    if-ne v3, p1, :cond_26

    const/4 v0, 0x1

    .line 114
    .local v0, "displaySectionHeaders":Z
    :goto_22
    invoke-virtual {p0, v1, p1, v0}, Lcom/behance/sdk/google/listview/SectionalBaseAdapter;->bindSectionHeader(Landroid/view/View;IZ)V

    .line 116
    return-object v1

    .line 112
    .end local v0    # "displaySectionHeaders":Z
    :cond_26
    const/4 v0, 0x0

    goto :goto_22
.end method

.method protected abstract onNextPageRequested(I)V
.end method

.method public onScroll(Landroid/widget/AbsListView;III)V
    .registers 6
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "firstVisibleItem"    # I
    .param p3, "visibleItemCount"    # I
    .param p4, "totalItemCount"    # I

    .prologue
    .line 92
    instance-of v0, p1, Lcom/behance/sdk/google/listview/SectionalListView;

    if-eqz v0, :cond_9

    .line 93
    check-cast p1, Lcom/behance/sdk/google/listview/SectionalListView;

    .end local p1    # "view":Landroid/widget/AbsListView;
    invoke-virtual {p1, p2}, Lcom/behance/sdk/google/listview/SectionalListView;->configureHeaderView(I)V

    .line 95
    :cond_9
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .registers 3
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "scrollState"    # I

    .prologue
    .line 100
    return-void
.end method

.method setHasMorePagesListener(Lcom/behance/sdk/google/listview/SectionalBaseAdapter$HasMorePagesListener;)V
    .registers 2
    .param p1, "hasMorePagesListener"    # Lcom/behance/sdk/google/listview/SectionalBaseAdapter$HasMorePagesListener;

    .prologue
    .line 27
    iput-object p1, p0, Lcom/behance/sdk/google/listview/SectionalBaseAdapter;->hasMorePagesListener:Lcom/behance/sdk/google/listview/SectionalBaseAdapter$HasMorePagesListener;

    .line 28
    return-void
.end method
