.class Lcom/localytics/android/TestModeListView$MenuDialog;
.super Landroid/app/Dialog;
.source "TestModeListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/localytics/android/TestModeListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MenuDialog"
.end annotation


# instance fields
.field private mDialogLayout:Landroid/widget/LinearLayout;

.field private mMetrics:Landroid/util/DisplayMetrics;

.field final synthetic this$0:Lcom/localytics/android/TestModeListView;


# direct methods
.method public constructor <init>(Lcom/localytics/android/TestModeListView;Landroid/content/Context;I)V
    .registers 4
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "theme"    # I

    .prologue
    .line 500
    iput-object p1, p0, Lcom/localytics/android/TestModeListView$MenuDialog;->this$0:Lcom/localytics/android/TestModeListView;

    .line 501
    invoke-direct {p0, p2, p3}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 503
    invoke-direct {p0}, Lcom/localytics/android/TestModeListView$MenuDialog;->setupViews()V

    .line 505
    invoke-direct {p0}, Lcom/localytics/android/TestModeListView$MenuDialog;->adjustLayout()V

    .line 506
    return-void
.end method

.method private adjustLayout()V
    .registers 7

    .prologue
    const/16 v5, 0x400

    .line 599
    new-instance v3, Landroid/util/DisplayMetrics;

    invoke-direct {v3}, Landroid/util/DisplayMetrics;-><init>()V

    iput-object v3, p0, Lcom/localytics/android/TestModeListView$MenuDialog;->mMetrics:Landroid/util/DisplayMetrics;

    .line 600
    iget-object v3, p0, Lcom/localytics/android/TestModeListView$MenuDialog;->this$0:Lcom/localytics/android/TestModeListView;

    invoke-virtual {v3}, Lcom/localytics/android/TestModeListView;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    const-string v4, "window"

    invoke-virtual {v3, v4}, Landroid/support/v4/app/FragmentActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/WindowManager;

    .line 601
    .local v2, "windowManager":Landroid/view/WindowManager;
    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    iget-object v4, p0, Lcom/localytics/android/TestModeListView$MenuDialog;->mMetrics:Landroid/util/DisplayMetrics;

    invoke-virtual {v3, v4}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 606
    invoke-virtual {p0}, Lcom/localytics/android/TestModeListView$MenuDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    .line 607
    .local v1, "window":Landroid/view/Window;
    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v1, v3}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 608
    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .line 609
    .local v0, "params":Landroid/view/WindowManager$LayoutParams;
    invoke-virtual {v1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 614
    invoke-virtual {v1, v5, v5}, Landroid/view/Window;->setFlags(II)V

    .line 615
    return-void
.end method

.method private setupViews()V
    .registers 12

    .prologue
    const/4 v10, -0x1

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 511
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/localytics/android/TestModeListView$MenuDialog;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v5, v6}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/localytics/android/TestModeListView$MenuDialog;->mDialogLayout:Landroid/widget/LinearLayout;

    .line 512
    iget-object v5, p0, Lcom/localytics/android/TestModeListView$MenuDialog;->mDialogLayout:Landroid/widget/LinearLayout;

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x2

    invoke-direct {v6, v10, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 513
    iget-object v5, p0, Lcom/localytics/android/TestModeListView$MenuDialog;->mDialogLayout:Landroid/widget/LinearLayout;

    const/16 v6, 0x10

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 514
    iget-object v5, p0, Lcom/localytics/android/TestModeListView$MenuDialog;->mDialogLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 517
    new-instance v2, Lcom/localytics/android/TestModeListView$MenuItemAdapter;

    iget-object v5, p0, Lcom/localytics/android/TestModeListView$MenuDialog;->this$0:Lcom/localytics/android/TestModeListView;

    iget-object v6, p0, Lcom/localytics/android/TestModeListView$MenuDialog;->this$0:Lcom/localytics/android/TestModeListView;

    invoke-virtual {v6}, Lcom/localytics/android/TestModeListView;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    invoke-direct {v2, v5, v6}, Lcom/localytics/android/TestModeListView$MenuItemAdapter;-><init>(Lcom/localytics/android/TestModeListView;Landroid/content/Context;)V

    .line 518
    .local v2, "menuAdapter":Lcom/localytics/android/TestModeListView$MenuItemAdapter;
    new-instance v3, Landroid/widget/ListView;

    iget-object v5, p0, Lcom/localytics/android/TestModeListView$MenuDialog;->this$0:Lcom/localytics/android/TestModeListView;

    invoke-virtual {v5}, Lcom/localytics/android/TestModeListView;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-direct {v3, v5}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    .line 519
    .local v3, "menus":Landroid/widget/ListView;
    invoke-virtual {v3, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 520
    new-instance v5, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v5, v8}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v3, v5}, Landroid/widget/ListView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 521
    invoke-virtual {v3, v9}, Landroid/widget/ListView;->setDividerHeight(I)V

    .line 522
    new-instance v5, Lcom/localytics/android/TestModeListView$MenuDialog$1;

    invoke-direct {v5, p0}, Lcom/localytics/android/TestModeListView$MenuDialog$1;-><init>(Lcom/localytics/android/TestModeListView$MenuDialog;)V

    invoke-virtual {v3, v5}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 570
    iget-object v5, p0, Lcom/localytics/android/TestModeListView$MenuDialog;->mDialogLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 573
    new-instance v4, Landroid/view/View;

    iget-object v5, p0, Lcom/localytics/android/TestModeListView$MenuDialog;->this$0:Lcom/localytics/android/TestModeListView;

    invoke-virtual {v5}, Lcom/localytics/android/TestModeListView;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 574
    .local v4, "space":Landroid/view/View;
    new-instance v5, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v5, v8}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 575
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v6, p0, Lcom/localytics/android/TestModeListView$MenuDialog;->this$0:Lcom/localytics/android/TestModeListView;

    invoke-virtual {v6}, Lcom/localytics/android/TestModeListView;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v6

    iget v6, v6, Landroid/util/DisplayMetrics;->density:F

    const/high16 v7, 0x41200000

    mul-float/2addr v6, v7

    const/high16 v7, 0x3f000000

    add-float/2addr v6, v7

    float-to-int v6, v6

    invoke-direct {v5, v10, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 576
    iget-object v5, p0, Lcom/localytics/android/TestModeListView$MenuDialog;->mDialogLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 578
    new-instance v1, Lcom/localytics/android/TestModeListView$CancelItemAdapter;

    iget-object v5, p0, Lcom/localytics/android/TestModeListView$MenuDialog;->this$0:Lcom/localytics/android/TestModeListView;

    iget-object v6, p0, Lcom/localytics/android/TestModeListView$MenuDialog;->this$0:Lcom/localytics/android/TestModeListView;

    invoke-virtual {v6}, Lcom/localytics/android/TestModeListView;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    invoke-direct {v1, v5, v6}, Lcom/localytics/android/TestModeListView$CancelItemAdapter;-><init>(Lcom/localytics/android/TestModeListView;Landroid/content/Context;)V

    .line 579
    .local v1, "cancelAdapter":Lcom/localytics/android/TestModeListView$CancelItemAdapter;
    new-instance v0, Landroid/widget/ListView;

    iget-object v5, p0, Lcom/localytics/android/TestModeListView$MenuDialog;->this$0:Lcom/localytics/android/TestModeListView;

    invoke-virtual {v5}, Lcom/localytics/android/TestModeListView;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-direct {v0, v5}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    .line 580
    .local v0, "cancel":Landroid/widget/ListView;
    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 581
    new-instance v5, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v5, v8}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v5}, Landroid/widget/ListView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 582
    new-instance v5, Lcom/localytics/android/TestModeListView$MenuDialog$2;

    invoke-direct {v5, p0}, Lcom/localytics/android/TestModeListView$MenuDialog$2;-><init>(Lcom/localytics/android/TestModeListView$MenuDialog;)V

    invoke-virtual {v0, v5}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 590
    iget-object v5, p0, Lcom/localytics/android/TestModeListView$MenuDialog;->mDialogLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 592
    invoke-virtual {p0, v9}, Lcom/localytics/android/TestModeListView$MenuDialog;->requestWindowFeature(I)Z

    .line 593
    iget-object v5, p0, Lcom/localytics/android/TestModeListView$MenuDialog;->mDialogLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v5}, Lcom/localytics/android/TestModeListView$MenuDialog;->setContentView(Landroid/view/View;)V

    .line 594
    return-void
.end method
