package harbor



import org.junit.*
import grails.test.mixin.*

@TestFor(UpdateController)
@Mock(Update)
class UpdateControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/update/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.updateInstanceList.size() == 0
        assert model.updateInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.updateInstance != null
    }

    void testSave() {
        controller.save()

        assert model.updateInstance != null
        assert view == '/update/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/update/show/1'
        assert controller.flash.message != null
        assert Update.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/update/list'

        populateValidParams(params)
        def update = new Update(params)

        assert update.save() != null

        params.id = update.id

        def model = controller.show()

        assert model.updateInstance == update
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/update/list'

        populateValidParams(params)
        def update = new Update(params)

        assert update.save() != null

        params.id = update.id

        def model = controller.edit()

        assert model.updateInstance == update
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/update/list'

        response.reset()

        populateValidParams(params)
        def update = new Update(params)

        assert update.save() != null

        // test invalid parameters in update
        params.id = update.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/update/edit"
        assert model.updateInstance != null

        update.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/update/show/$update.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        update.clearErrors()

        populateValidParams(params)
        params.id = update.id
        params.version = -1
        controller.update()

        assert view == "/update/edit"
        assert model.updateInstance != null
        assert model.updateInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/update/list'

        response.reset()

        populateValidParams(params)
        def update = new Update(params)

        assert update.save() != null
        assert Update.count() == 1

        params.id = update.id

        controller.delete()

        assert Update.count() == 0
        assert Update.get(update.id) == null
        assert response.redirectedUrl == '/update/list'
    }
}
