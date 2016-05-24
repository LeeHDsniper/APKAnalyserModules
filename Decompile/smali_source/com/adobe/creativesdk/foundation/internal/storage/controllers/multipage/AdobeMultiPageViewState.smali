.class public final enum Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;
.super Ljava/lang/Enum;
.source "AdobeMultiPageViewState.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

.field public static final enum AdobeMultiPageGridView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

.field public static final enum AdobeMultiPageListView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

.field public static final enum AdobeMultiPageViewPager:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 7
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    const-string v1, "AdobeMultiPageGridView"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;->AdobeMultiPageGridView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    .line 8
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    const-string v1, "AdobeMultiPageListView"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;->AdobeMultiPageListView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    .line 9
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    const-string v1, "AdobeMultiPageViewPager"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;->AdobeMultiPageViewPager:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    .line 6
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;->AdobeMultiPageGridView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;->AdobeMultiPageListView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;->AdobeMultiPageViewPager:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    aput-object v1, v0, v4

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

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
    .line 6
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 6
    const-class v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;
    .registers 1

    .prologue
    .line 6
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    return-object v0
.end method
