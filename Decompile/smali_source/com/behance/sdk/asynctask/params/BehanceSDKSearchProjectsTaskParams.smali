.class public Lcom/behance/sdk/asynctask/params/BehanceSDKSearchProjectsTaskParams;
.super Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;
.source "BehanceSDKSearchProjectsTaskParams.java"


# instance fields
.field private city:Ljava/lang/String;

.field private country:Ljava/lang/String;

.field private field:Ljava/lang/String;

.field private pageNumber:I

.field private pageSize:I

.field private searchString:Ljava/lang/String;

.field private sortOption:Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

.field private state:Ljava/lang/String;

.field private timeSpan:Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;-><init>()V

    return-void
.end method


# virtual methods
.method public getCity()Ljava/lang/String;
    .registers 2

    .prologue
    .line 103
    iget-object v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKSearchProjectsTaskParams;->city:Ljava/lang/String;

    return-object v0
.end method

.method public getCountry()Ljava/lang/String;
    .registers 2

    .prologue
    .line 73
    iget-object v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKSearchProjectsTaskParams;->country:Ljava/lang/String;

    return-object v0
.end method

.method public getField()Ljava/lang/String;
    .registers 2

    .prologue
    .line 62
    iget-object v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKSearchProjectsTaskParams;->field:Ljava/lang/String;

    return-object v0
.end method

.method public getPageNumber()I
    .registers 2

    .prologue
    .line 115
    iget v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKSearchProjectsTaskParams;->pageNumber:I

    return v0
.end method

.method public getPageSize()I
    .registers 2

    .prologue
    .line 123
    iget v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKSearchProjectsTaskParams;->pageSize:I

    if-lez v0, :cond_7

    .line 124
    iget v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKSearchProjectsTaskParams;->pageSize:I

    .line 126
    :goto_6
    return v0

    :cond_7
    const/16 v0, 0x8

    goto :goto_6
.end method

.method public getSearchString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 139
    iget-object v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKSearchProjectsTaskParams;->searchString:Ljava/lang/String;

    return-object v0
.end method

.method public getSortOption()Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;
    .registers 2

    .prologue
    .line 46
    iget-object v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKSearchProjectsTaskParams;->sortOption:Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

    return-object v0
.end method

.method public getState()Ljava/lang/String;
    .registers 2

    .prologue
    .line 88
    iget-object v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKSearchProjectsTaskParams;->state:Ljava/lang/String;

    return-object v0
.end method

.method public getTimeSpan()Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;
    .registers 2

    .prologue
    .line 54
    iget-object v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKSearchProjectsTaskParams;->timeSpan:Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;

    return-object v0
.end method
