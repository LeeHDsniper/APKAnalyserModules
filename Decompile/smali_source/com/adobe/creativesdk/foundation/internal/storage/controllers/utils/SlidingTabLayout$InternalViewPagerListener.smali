.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$InternalViewPagerListener;
.super Ljava/lang/Object;
.source "SlidingTabLayout.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InternalViewPagerListener"
.end annotation


# instance fields
.field private mScrollState:I

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;


# direct methods
.method private constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;)V
    .registers 2

    .prologue
    .line 324
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$InternalViewPagerListener;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;
    .param p2, "x1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$1;

    .prologue
    .line 324
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$InternalViewPagerListener;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;)V

    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .registers 3
    .param p1, "state"    # I

    .prologue
    .line 350
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$InternalViewPagerListener;->mScrollState:I

    .line 352
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$InternalViewPagerListener;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mViewPagerPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;)Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    move-result-object v0

    if-eqz v0, :cond_13

    .line 353
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$InternalViewPagerListener;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mViewPagerPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;)Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageScrollStateChanged(I)V

    .line 355
    :cond_13
    return-void
.end method

.method public onPageScrolled(IFI)V
    .registers 8
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F
    .param p3, "positionOffsetPixels"    # I

    .prologue
    .line 329
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$InternalViewPagerListener;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mTabStrip:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;
    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->getChildCount()I

    move-result v2

    .line 330
    .local v2, "tabStripChildCount":I
    if-eqz v2, :cond_10

    if-ltz p1, :cond_10

    if-lt p1, v2, :cond_11

    .line 346
    :cond_10
    :goto_10
    return-void

    .line 334
    :cond_11
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$InternalViewPagerListener;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mTabStrip:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;
    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->onViewPagerPageChanged(IF)V

    .line 336
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$InternalViewPagerListener;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mTabStrip:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;
    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 337
    .local v1, "selectedTitle":Landroid/view/View;
    if-eqz v1, :cond_44

    .line 338
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v3, p2

    float-to-int v0, v3

    .line 340
    .local v0, "extraOffset":I
    :goto_2d
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$InternalViewPagerListener;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->scrollToTab(II)V
    invoke-static {v3, p1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;II)V

    .line 342
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$InternalViewPagerListener;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mViewPagerPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;
    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;)Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    move-result-object v3

    if-eqz v3, :cond_10

    .line 343
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$InternalViewPagerListener;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mViewPagerPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;
    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;)Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    move-result-object v3

    invoke-interface {v3, p1, p2, p3}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageScrolled(IFI)V

    goto :goto_10

    .line 338
    .end local v0    # "extraOffset":I
    :cond_44
    const/4 v0, 0x0

    goto :goto_2d
.end method

.method public onPageSelected(I)V
    .registers 6
    .param p1, "position"    # I

    .prologue
    const/4 v2, 0x0

    .line 359
    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$InternalViewPagerListener;->mScrollState:I

    if-nez v1, :cond_14

    .line 360
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$InternalViewPagerListener;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mTabStrip:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;

    move-result-object v1

    const/4 v3, 0x0

    invoke-virtual {v1, p1, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->onViewPagerPageChanged(IF)V

    .line 361
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$InternalViewPagerListener;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->scrollToTab(II)V
    invoke-static {v1, p1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;II)V

    .line 363
    :cond_14
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_15
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$InternalViewPagerListener;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mTabStrip:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_36

    .line 364
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$InternalViewPagerListener;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mTabStrip:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    if-ne p1, v0, :cond_34

    const/4 v1, 0x1

    :goto_2e
    invoke-virtual {v3, v1}, Landroid/view/View;->setSelected(Z)V

    .line 363
    add-int/lit8 v0, v0, 0x1

    goto :goto_15

    :cond_34
    move v1, v2

    .line 364
    goto :goto_2e

    .line 366
    :cond_36
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$InternalViewPagerListener;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mViewPagerPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;)Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    move-result-object v1

    if-eqz v1, :cond_47

    .line 367
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$InternalViewPagerListener;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mViewPagerPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;)Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    move-result-object v1

    invoke-interface {v1, p1}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageSelected(I)V

    .line 369
    :cond_47
    return-void
.end method
