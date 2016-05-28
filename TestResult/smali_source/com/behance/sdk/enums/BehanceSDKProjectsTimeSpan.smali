.class public final enum Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;
.super Ljava/lang/Enum;
.source "BehanceSDKProjectsTimeSpan.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;

.field public static final enum ALL:Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;

.field public static final enum MONTH:Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;

.field public static final enum TODAY:Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;

.field public static final enum WEEK:Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;


# instance fields
.field private actualValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 4
    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;

    const-string v1, "ALL"

    const-string v2, "all"

    invoke-direct {v0, v1, v3, v2}, Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;->ALL:Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;

    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;

    const-string v1, "WEEK"

    const-string v2, "week"

    invoke-direct {v0, v1, v4, v2}, Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;->WEEK:Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;

    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;

    const-string v1, "MONTH"

    const-string v2, "month"

    invoke-direct {v0, v1, v5, v2}, Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;->MONTH:Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;

    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;

    const-string v1, "TODAY"

    const-string v2, "today"

    invoke-direct {v0, v1, v6, v2}, Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;->TODAY:Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;

    .line 3
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;->ALL:Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;

    aput-object v1, v0, v3

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;->WEEK:Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;

    aput-object v1, v0, v4

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;->MONTH:Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;

    aput-object v1, v0, v5

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;->TODAY:Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;

    aput-object v1, v0, v6

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;->$VALUES:[Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4
    .param p3, "actualValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 8
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 9
    iput-object p3, p0, Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;->actualValue:Ljava/lang/String;

    .line 10
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 3
    const-class v0, Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;

    return-object v0
.end method

.method public static values()[Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;
    .registers 1

    .prologue
    .line 3
    sget-object v0, Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;->$VALUES:[Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;

    invoke-virtual {v0}, [Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 30
    iget-object v0, p0, Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;->actualValue:Ljava/lang/String;

    return-object v0
.end method
