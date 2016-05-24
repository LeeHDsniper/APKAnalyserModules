.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerItem;
.super Ljava/lang/Object;
.source "AdobeUxActionBarDropDownController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DataSourceSectionSpinnerItem"
.end annotation


# instance fields
.field private final ccSection:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$CCSection;

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;

.field private final title:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$CCSection;Ljava/lang/String;)V
    .registers 4
    .param p2, "ccSection"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$CCSection;
    .param p3, "title"    # Ljava/lang/String;

    .prologue
    .line 169
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerItem;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 170
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerItem;->ccSection:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$CCSection;

    .line 171
    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerItem;->title:Ljava/lang/String;

    .line 172
    return-void
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerItem;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$CCSection;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerItem;

    .prologue
    .line 165
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerItem;->ccSection:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$CCSection;

    return-object v0
.end method

.method static synthetic access$500(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerItem;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerItem;

    .prologue
    .line 165
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$DataSourceSectionSpinnerItem;->title:Ljava/lang/String;

    return-object v0
.end method
