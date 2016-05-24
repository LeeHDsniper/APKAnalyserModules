.class Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;
.super Ljava/lang/Object;
.source "DragSortListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DragSortTracker"
.end annotation


# instance fields
.field mBuilder:Ljava/lang/StringBuilder;

.field mFile:Ljava/io/File;

.field private mNumFlushes:I

.field private mNumInBuffer:I

.field private mTracking:Z

.field final synthetic this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;


# direct methods
.method public constructor <init>(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)V
    .registers 6

    .prologue
    const/4 v3, 0x0

    .line 2913
    iput-object p1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2904
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mBuilder:Ljava/lang/StringBuilder;

    .line 2908
    iput v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mNumInBuffer:I

    .line 2909
    iput v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mNumFlushes:I

    .line 2911
    iput-boolean v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mTracking:Z

    .line 2914
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    .line 2915
    .local v1, "root":Ljava/io/File;
    new-instance v2, Ljava/io/File;

    const-string v3, "dslv_state.txt"

    invoke-direct {v2, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mFile:Ljava/io/File;

    .line 2917
    iget-object v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_34

    .line 2919
    :try_start_28
    iget-object v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->createNewFile()Z

    .line 2920
    const-string v2, "mobeta"

    const-string v3, "file created"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_34
    .catch Ljava/io/IOException; {:try_start_28 .. :try_end_34} :catch_35

    .line 2927
    :cond_34
    :goto_34
    return-void

    .line 2921
    :catch_35
    move-exception v0

    .line 2922
    .local v0, "e":Ljava/io/IOException;
    const-string v2, "mobeta"

    const-string v3, "Could not create dslv_state.txt"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2923
    const-string v2, "mobeta"

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_34
.end method


# virtual methods
.method public appendState()V
    .registers 8

    .prologue
    .line 2936
    iget-boolean v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mTracking:Z

    if-nez v3, :cond_5

    .line 2987
    :cond_4
    :goto_4
    return-void

    .line 2940
    :cond_5
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mBuilder:Ljava/lang/StringBuilder;

    const-string v4, "<DSLVState>\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2941
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v3}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildCount()I

    move-result v0

    .line 2942
    .local v0, "children":I
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v3}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getFirstVisiblePosition()I

    move-result v1

    .line 2943
    .local v1, "first":I
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mBuilder:Ljava/lang/StringBuilder;

    const-string v4, "    <Positions>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2944
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_20
    if-ge v2, v0, :cond_32

    .line 2945
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mBuilder:Ljava/lang/StringBuilder;

    add-int v4, v1, v2

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2944
    add-int/lit8 v2, v2, 0x1

    goto :goto_20

    .line 2947
    :cond_32
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mBuilder:Ljava/lang/StringBuilder;

    const-string v4, "</Positions>\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2949
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mBuilder:Ljava/lang/StringBuilder;

    const-string v4, "    <Tops>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2950
    const/4 v2, 0x0

    :goto_41
    if-ge v2, v0, :cond_5b

    .line 2951
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mBuilder:Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v4, v2}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2950
    add-int/lit8 v2, v2, 0x1

    goto :goto_41

    .line 2953
    :cond_5b
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mBuilder:Ljava/lang/StringBuilder;

    const-string v4, "</Tops>\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2954
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mBuilder:Ljava/lang/StringBuilder;

    const-string v4, "    <Bottoms>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2955
    const/4 v2, 0x0

    :goto_6a
    if-ge v2, v0, :cond_84

    .line 2956
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mBuilder:Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v4, v2}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getBottom()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2955
    add-int/lit8 v2, v2, 0x1

    goto :goto_6a

    .line 2958
    :cond_84
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mBuilder:Ljava/lang/StringBuilder;

    const-string v4, "</Bottoms>\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2960
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mBuilder:Ljava/lang/StringBuilder;

    const-string v4, "    <FirstExpPos>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I
    invoke-static {v4}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$1300(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "</FirstExpPos>\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2961
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mBuilder:Ljava/lang/StringBuilder;

    const-string v4, "    <FirstExpBlankHeight>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    iget-object v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .line 2962
    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I
    invoke-static {v5}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$1300(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I

    move-result v5

    # invokes: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getItemHeight(I)I
    invoke-static {v4, v5}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$2800(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;I)I

    move-result v4

    iget-object v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    iget-object v6, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I
    invoke-static {v6}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$1300(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I

    move-result v6

    # invokes: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildHeight(I)I
    invoke-static {v5, v6}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$2900(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;I)I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "</FirstExpBlankHeight>\n"

    .line 2963
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2964
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mBuilder:Ljava/lang/StringBuilder;

    const-string v4, "    <SecondExpPos>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I
    invoke-static {v4}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$1400(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "</SecondExpPos>\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2965
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mBuilder:Ljava/lang/StringBuilder;

    const-string v4, "    <SecondExpBlankHeight>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    iget-object v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .line 2966
    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I
    invoke-static {v5}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$1400(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I

    move-result v5

    # invokes: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getItemHeight(I)I
    invoke-static {v4, v5}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$2800(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;I)I

    move-result v4

    iget-object v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    iget-object v6, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I
    invoke-static {v6}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$1400(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I

    move-result v6

    # invokes: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildHeight(I)I
    invoke-static {v5, v6}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$2900(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;I)I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "</SecondExpBlankHeight>\n"

    .line 2967
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2968
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mBuilder:Ljava/lang/StringBuilder;

    const-string v4, "    <SrcPos>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I
    invoke-static {v4}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$900(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "</SrcPos>\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2969
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mBuilder:Ljava/lang/StringBuilder;

    const-string v4, "    <SrcHeight>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewHeight:I
    invoke-static {v4}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$1100(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I

    move-result v4

    iget-object v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v5}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getDividerHeight()I

    move-result v5

    add-int/2addr v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "</SrcHeight>\n"

    .line 2970
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2971
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mBuilder:Ljava/lang/StringBuilder;

    const-string v4, "    <ViewHeight>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v4}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getHeight()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "</ViewHeight>\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2972
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mBuilder:Ljava/lang/StringBuilder;

    const-string v4, "    <LastY>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mLastY:I
    invoke-static {v4}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$3000(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "</LastY>\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2973
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mBuilder:Ljava/lang/StringBuilder;

    const-string v4, "    <FloatY>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewMid:I
    invoke-static {v4}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$2000(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "</FloatY>\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2974
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mBuilder:Ljava/lang/StringBuilder;

    const-string v4, "    <ShuffleEdges>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2975
    const/4 v2, 0x0

    :goto_18f
    if-ge v2, v0, :cond_1b1

    .line 2976
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mBuilder:Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    add-int v5, v1, v2

    iget-object v6, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v6, v2}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/View;->getTop()I

    move-result v6

    # invokes: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getShuffleEdge(II)I
    invoke-static {v4, v5, v6}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$3100(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;II)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2975
    add-int/lit8 v2, v2, 0x1

    goto :goto_18f

    .line 2978
    :cond_1b1
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mBuilder:Ljava/lang/StringBuilder;

    const-string v4, "</ShuffleEdges>\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2980
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mBuilder:Ljava/lang/StringBuilder;

    const-string v4, "</DSLVState>\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2981
    iget v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mNumInBuffer:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mNumInBuffer:I

    .line 2983
    iget v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mNumInBuffer:I

    const/16 v4, 0x3e8

    if-le v3, v4, :cond_4

    .line 2984
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->flush()V

    .line 2985
    const/4 v3, 0x0

    iput v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mNumInBuffer:I

    goto/16 :goto_4
.end method

.method public flush()V
    .registers 6

    .prologue
    .line 2990
    iget-boolean v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mTracking:Z

    if-nez v2, :cond_5

    .line 3012
    :goto_4
    return-void

    .line 2996
    :cond_5
    const/4 v0, 0x1

    .line 2997
    .local v0, "append":Z
    :try_start_6
    iget v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mNumFlushes:I

    if-nez v2, :cond_b

    .line 2998
    const/4 v0, 0x0

    .line 3000
    :cond_b
    new-instance v1, Ljava/io/FileWriter;

    iget-object v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mFile:Ljava/io/File;

    invoke-direct {v1, v2, v0}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    .line 3002
    .local v1, "writer":Ljava/io/FileWriter;
    iget-object v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    .line 3003
    iget-object v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mBuilder:Ljava/lang/StringBuilder;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 3005
    invoke-virtual {v1}, Ljava/io/FileWriter;->flush()V

    .line 3006
    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V

    .line 3008
    iget v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mNumFlushes:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mNumFlushes:I
    :try_end_33
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_33} :catch_34

    goto :goto_4

    .line 3009
    .end local v1    # "writer":Ljava/io/FileWriter;
    :catch_34
    move-exception v2

    goto :goto_4
.end method

.method public startTracking()V
    .registers 3

    .prologue
    .line 2930
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mBuilder:Ljava/lang/StringBuilder;

    const-string v1, "<DSLVStates>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2931
    const/4 v0, 0x0

    iput v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mNumFlushes:I

    .line 2932
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mTracking:Z

    .line 2933
    return-void
.end method

.method public stopTracking()V
    .registers 3

    .prologue
    .line 3015
    iget-boolean v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mTracking:Z

    if-eqz v0, :cond_11

    .line 3016
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mBuilder:Ljava/lang/StringBuilder;

    const-string v1, "</DSLVStates>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3017
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->flush()V

    .line 3018
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragSortTracker;->mTracking:Z

    .line 3020
    :cond_11
    return-void
.end method
