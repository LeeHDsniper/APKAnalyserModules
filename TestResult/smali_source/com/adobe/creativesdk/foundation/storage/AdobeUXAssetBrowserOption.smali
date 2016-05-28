.class public final enum Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;
.super Ljava/lang/Enum;
.source "AdobeUXAssetBrowserOption.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

.field public static final enum ENABLE_MULTI_SELECT:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

.field public static final enum ENABLE_MYACCOUNT_OPTION:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

.field public static final enum SHOW_LIST_VIEW_ON_POPUP:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

.field public static final enum SHOW_MULTI_SELECT_ON_POPUP:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

.field public static final enum SORT_ALPHABETICALLY_ON_POPUP:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 30
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

    const-string v1, "ENABLE_MULTI_SELECT"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;->ENABLE_MULTI_SELECT:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

    .line 36
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

    const-string v1, "SHOW_MULTI_SELECT_ON_POPUP"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;->SHOW_MULTI_SELECT_ON_POPUP:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

    .line 41
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

    const-string v1, "SHOW_LIST_VIEW_ON_POPUP"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;->SHOW_LIST_VIEW_ON_POPUP:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

    .line 46
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

    const-string v1, "SORT_ALPHABETICALLY_ON_POPUP"

    invoke-direct {v0, v1, v5}, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;->SORT_ALPHABETICALLY_ON_POPUP:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

    .line 63
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

    const-string v1, "ENABLE_MYACCOUNT_OPTION"

    invoke-direct {v0, v1, v6}, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;->ENABLE_MYACCOUNT_OPTION:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

    .line 25
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;->ENABLE_MULTI_SELECT:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;->SHOW_MULTI_SELECT_ON_POPUP:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;->SHOW_LIST_VIEW_ON_POPUP:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;->SORT_ALPHABETICALLY_ON_POPUP:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

    aput-object v1, v0, v5

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;->ENABLE_MYACCOUNT_OPTION:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

    aput-object v1, v0, v6

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;->$VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 25
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 25
    const-class v0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;
    .registers 1

    .prologue
    .line 25
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;->$VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

    return-object v0
.end method
