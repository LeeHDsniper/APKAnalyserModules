.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$TabClickListener;
.super Ljava/lang/Object;
.source "SlidingTabLayout.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TabClickListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;


# direct methods
.method private constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;)V
    .registers 2

    .prologue
    .line 373
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$TabClickListener;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;
    .param p2, "x1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$1;

    .prologue
    .line 373
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$TabClickListener;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 376
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$TabClickListener;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mTabStrip:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_22

    .line 377
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$TabClickListener;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mTabStrip:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    if-ne p1, v1, :cond_23

    .line 378
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$TabClickListener;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->mViewPager:Landroid/support/v4/view/ViewPager;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->access$500(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;)Landroid/support/v4/view/ViewPager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    .line 382
    :cond_22
    return-void

    .line 376
    :cond_23
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method
