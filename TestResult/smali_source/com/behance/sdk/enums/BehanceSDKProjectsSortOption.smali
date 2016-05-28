.class public final enum Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;
.super Ljava/lang/Enum;
.source "BehanceSDKProjectsSortOption.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

.field public static final enum APPRECIATIONS:Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

.field public static final enum COMMENTS:Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

.field public static final enum FEATURED_DATE:Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

.field public static final enum PUBLISHED_DATE:Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

.field public static final enum RELEVANCE:Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

.field public static final enum VIEWS:Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;


# instance fields
.field actualValue:Ljava/lang/String;

.field private displayresource:I

.field index:I


# direct methods
.method static constructor <clinit>()V
    .registers 13

    .prologue
    const/4 v12, 0x4

    const/4 v11, 0x3

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v2, 0x0

    .line 7
    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

    const-string v1, "FEATURED_DATE"

    const-string v3, "featured_date"

    sget v4, Lcom/behance/sdk/R$string;->bsdk_sort_option_featured:I

    move v5, v2

    invoke-direct/range {v0 .. v5}, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;-><init>(Ljava/lang/String;ILjava/lang/String;II)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;->FEATURED_DATE:Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

    new-instance v3, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

    const-string v4, "APPRECIATIONS"

    const-string v6, "appreciations"

    sget v7, Lcom/behance/sdk/R$string;->bsdk_sort_option_most_appreciated:I

    move v5, v9

    move v8, v9

    invoke-direct/range {v3 .. v8}, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;-><init>(Ljava/lang/String;ILjava/lang/String;II)V

    sput-object v3, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;->APPRECIATIONS:Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

    new-instance v3, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

    const-string v4, "VIEWS"

    const-string v6, "views"

    sget v7, Lcom/behance/sdk/R$string;->bsdk_sort_option_most_viewed:I

    move v5, v10

    move v8, v10

    invoke-direct/range {v3 .. v8}, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;-><init>(Ljava/lang/String;ILjava/lang/String;II)V

    sput-object v3, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;->VIEWS:Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

    .line 8
    new-instance v3, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

    const-string v4, "COMMENTS"

    const-string v6, "comments"

    sget v7, Lcom/behance/sdk/R$string;->bsdk_sort_option_most_discussed:I

    move v5, v11

    move v8, v11

    invoke-direct/range {v3 .. v8}, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;-><init>(Ljava/lang/String;ILjava/lang/String;II)V

    sput-object v3, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;->COMMENTS:Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

    new-instance v3, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

    const-string v4, "PUBLISHED_DATE"

    const-string v6, "published_date"

    sget v7, Lcom/behance/sdk/R$string;->bsdk_sort_option_most_recent:I

    move v5, v12

    move v8, v12

    invoke-direct/range {v3 .. v8}, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;-><init>(Ljava/lang/String;ILjava/lang/String;II)V

    sput-object v3, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;->PUBLISHED_DATE:Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

    .line 9
    new-instance v3, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

    const-string v4, "RELEVANCE"

    const/4 v5, 0x5

    const-string v6, "relevance"

    sget v7, Lcom/behance/sdk/R$string;->bsdk_sort_option_most_relevant:I

    const/4 v8, 0x5

    invoke-direct/range {v3 .. v8}, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;-><init>(Ljava/lang/String;ILjava/lang/String;II)V

    sput-object v3, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;->RELEVANCE:Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

    .line 5
    const/4 v0, 0x6

    new-array v0, v0, [Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;->FEATURED_DATE:Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

    aput-object v1, v0, v2

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;->APPRECIATIONS:Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

    aput-object v1, v0, v9

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;->VIEWS:Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

    aput-object v1, v0, v10

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;->COMMENTS:Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

    aput-object v1, v0, v11

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;->PUBLISHED_DATE:Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

    aput-object v1, v0, v12

    const/4 v1, 0x5

    sget-object v2, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;->RELEVANCE:Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

    aput-object v2, v0, v1

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;->$VALUES:[Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;II)V
    .registers 6
    .param p3, "actualValue"    # Ljava/lang/String;
    .param p4, "displayresource"    # I
    .param p5, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "II)V"
        }
    .end annotation

    .prologue
    .line 15
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 16
    iput-object p3, p0, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;->actualValue:Ljava/lang/String;

    .line 17
    iput p4, p0, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;->displayresource:I

    .line 18
    iput p5, p0, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;->index:I

    .line 19
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 5
    const-class v0, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

    return-object v0
.end method

.method public static values()[Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;
    .registers 1

    .prologue
    .line 5
    sget-object v0, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;->$VALUES:[Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

    invoke-virtual {v0}, [Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 56
    iget-object v0, p0, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;->actualValue:Ljava/lang/String;

    return-object v0
.end method
