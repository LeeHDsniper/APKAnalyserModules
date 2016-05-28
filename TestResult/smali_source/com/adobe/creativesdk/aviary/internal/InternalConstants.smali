.class public final Lcom/adobe/creativesdk/aviary/internal/InternalConstants;
.super Ljava/lang/Object;
.source "InternalConstants.java"


# static fields
.field public static final DEFAULT_SIZE:Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

.field public static final LARGE_SIZE:Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

.field public static final NORMAL_SIZE:Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

.field public static final ORIGINAL_SIZE:Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 25
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;->Mp15:Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/InternalConstants;->DEFAULT_SIZE:Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

    .line 26
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;->Mp3:Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/InternalConstants;->NORMAL_SIZE:Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

    .line 27
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;->Mp5:Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/InternalConstants;->LARGE_SIZE:Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

    .line 28
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;->Mp15:Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/InternalConstants;->ORIGINAL_SIZE:Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
