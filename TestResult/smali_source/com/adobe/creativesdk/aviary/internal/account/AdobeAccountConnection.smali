.class public Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;
.super Ljava/lang/Object;
.source "AdobeAccountConnection.java"


# instance fields
.field private connectionSubject:Lrx/subjects/PublishSubject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/PublishSubject",
            "<",
            "Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;",
            ">;"
        }
    .end annotation
.end field

.field private context:Landroid/content/Context;

.field private logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

.field private mConnected:Z

.field private mConnecting:Z

.field private mDisposed:Z

.field final mExecutor:Ljava/util/concurrent/Executor;

.field private mSemaphore:Ljava/util/concurrent/Semaphore;

.field private mService:Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

.field private mServiceConnection:Landroid/content/ServiceConnection;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mExecutor:Ljava/util/concurrent/Executor;

    .line 38
    new-instance v0, Ljava/util/concurrent/Semaphore;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mSemaphore:Ljava/util/concurrent/Semaphore;

    .line 40
    const-string v0, "AdobeAccountConnection"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    .line 44
    invoke-static {}, Lrx/subjects/PublishSubject;->create()Lrx/subjects/PublishSubject;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->connectionSubject:Lrx/subjects/PublishSubject;

    .line 47
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->context:Landroid/content/Context;

    .line 48
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-object v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    .prologue
    .line 34
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mConnected:Z

    return v0
.end method

.method static synthetic access$102(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;
    .param p1, "x1"    # Z

    .prologue
    .line 34
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mConnected:Z

    return p1
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mService:Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    return-object v0
.end method

.method static synthetic access$202(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;)Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;
    .param p1, "x1"    # Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    .prologue
    .line 34
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mService:Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    return-object p1
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Lrx/subjects/PublishSubject;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->connectionSubject:Lrx/subjects/PublishSubject;

    return-object v0
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Ljava/util/concurrent/Semaphore;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mSemaphore:Ljava/util/concurrent/Semaphore;

    return-object v0
.end method

.method static synthetic access$500(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    .prologue
    .line 34
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mDisposed:Z

    return v0
.end method

.method static synthetic access$502(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;
    .param p1, "x1"    # Z

    .prologue
    .line 34
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mDisposed:Z

    return p1
.end method

.method static synthetic access$600(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    .prologue
    .line 34
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mConnecting:Z

    return v0
.end method

.method static synthetic access$602(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;
    .param p1, "x1"    # Z

    .prologue
    .line 34
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mConnecting:Z

    return p1
.end method

.method static synthetic access$700(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Landroid/content/ServiceConnection;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mServiceConnection:Landroid/content/ServiceConnection;

    return-object v0
.end method

.method static synthetic access$702(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;Landroid/content/ServiceConnection;)Landroid/content/ServiceConnection;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;
    .param p1, "x1"    # Landroid/content/ServiceConnection;

    .prologue
    .line 34
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mServiceConnection:Landroid/content/ServiceConnection;

    return-object p1
.end method

.method static synthetic access$800(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Landroid/content/Context;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$802(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;Landroid/content/Context;)Landroid/content/Context;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 34
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->context:Landroid/content/Context;

    return-object p1
.end method


# virtual methods
.method public dispose()V
    .registers 4

    .prologue
    .line 178
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$4;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$4;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mExecutor:Ljava/util/concurrent/Executor;

    .line 220
    invoke-static {v1}, Lrx/schedulers/Schedulers;->from(Ljava/util/concurrent/Executor;)Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$2;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$2;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)V

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$3;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$3;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)V

    .line 221
    invoke-virtual {v0, v1, v2}, Lrx/Observable;->subscribe(Lrx/functions/Action1;Lrx/functions/Action1;)Lrx/Subscription;

    .line 233
    return-void
.end method

.method public getService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;
    .registers 2

    .prologue
    .line 59
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mService:Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    return-object v0
.end method

.method public isConnected()Z
    .registers 2

    .prologue
    .line 55
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mConnected:Z

    return v0
.end method

.method public tryConnect()Lrx/Observable;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<",
            "Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;",
            ">;"
        }
    .end annotation

    .prologue
    .line 83
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "tryConnect"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 85
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$1;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    .line 172
    invoke-static {}, Lrx/android/schedulers/AndroidSchedulers;->mainThread()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->observeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->mExecutor:Ljava/util/concurrent/Executor;

    .line 173
    invoke-static {v1}, Lrx/schedulers/Schedulers;->from(Ljava/util/concurrent/Executor;)Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method
